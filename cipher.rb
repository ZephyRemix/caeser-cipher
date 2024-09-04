class Cipher
  def initialize(str, shift_factor)
    @str = str
    @shift_factor = shift_factor
  end

  def caesar_cipher
    letters = ('a'..'z').to_a
    @shift_factor %= letters.size # Normalize the shift value
  
    p @str.chars.map { |c| shift_char(c, @shift_factor, letters) }.join
  end
  
  def shift_char(c, n, letters)
    index = letters.find_index(c.downcase)
    return c unless index
  
    shifted_char = letters[(index + n) % letters.size]
  
    c == c.upcase ? shifted_char.upcase : shifted_char
  end
  
end
