require 'rubocop'

def caesar_cipher(str, n)
  letters = ('a'..'z').to_a
  n %= letters.size # Normalize the shift value

  str.chars.map { |c| shift_char(c, n, letters) }.join
end

def shift_char(c, n, letters)
  index = letters.find_index(c.downcase)
  return c unless index

  shifted_char = letters[(index + n) % letters.size]

  c == c.upcase ? shifted_char.upcase : shifted_char
end

str = gets.chomp
p caesar_cipher(str, 5)
