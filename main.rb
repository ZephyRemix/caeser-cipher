require_relative "cipher"
require 'rubocop'

str = gets.chomp
cipher = Cipher.new(str, 5)
cipher.caesar_cipher