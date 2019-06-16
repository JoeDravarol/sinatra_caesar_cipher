class CaesarCipher
  attr_reader :downcase_alpha, :upcase_alpha

  def initialize
    @downcase_alpha = ("a".."z").to_a
    @upcase_alpha = ("A".."Z").to_a
  end

  def encrypt_message(str, key)
    letters = str.split("")

    newStr = letters.map do |letter|
      if downcase_alpha.include?(letter)
        alphabet_index = downcase_alpha.index(letter) + key

        encrypt_letter(downcase_alpha, alphabet_index)
      elsif upcase_alpha.include?(letter)
        alphabet_index = upcase_alpha.index(letter) + key

        encrypt_letter(upcase_alpha, alphabet_index)
      else
        letter
      end
    end

    newStr.join
  end

  private 

  # Recursion to deal with large number to shift
  def encrypt_letter(case_type, arr_index)
    return case_type[arr_index] if arr_index <= 25

    arr_index = encrypt_letter(case_type, arr_index - 25)
  end
end
