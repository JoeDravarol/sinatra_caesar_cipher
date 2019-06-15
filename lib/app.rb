class CaesarCipherApp < Sinatra::Base
  set :root, 'lib/app'
  
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end
end