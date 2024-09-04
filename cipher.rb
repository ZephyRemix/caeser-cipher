class Cipher
  def initialize(str, shift_factor)
    @str = str
    @shift_factor = shift_factor
    @cipher_dict = ('a'..'z').to_a
  end

  def caesar_cipher
    normalize_shift_factor if @shift_factor > @cipher_dict.size 
    cipher_text = encrypt_message

    puts cipher_text
  end
  
  def normalize_shift_factor
    @shift_factor %= @cipher_dict.size      
  end

  def encrypt_message
    @str.chars.map { |c| shift_char(c) }.join
  end

  private 
  
  def shift_char(c)
    index = @cipher_dict.find_index(c.downcase)
    return c unless index
  
    shifted_char = @cipher_dict[(index + @shift_factor) % @cipher_dict.size]
  
    c == c.upcase ? shifted_char.upcase : shifted_char
  end
  
end
