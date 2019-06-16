require 'caesar_cipher'

class CaesarCipherApp < Sinatra::Base
  set :root, 'lib/app'
  
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    cipher = CaesarCipher.new
    phrase = params["message"]
    key = params["shift_key"].to_i

    message = cipher.encrypt_message(phrase, key) if !phrase.nil? && !key.nil?

    erb :index, locals: {encrypted_message: message}
  end
end