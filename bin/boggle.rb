#!/usr/bin/env ruby

require_relative '../lib/board'
require_relative '../lib/dictionary'

DICTIONARY_PATH = File.join(__dir__, '..', 'data', '4plus_dict')

puts "Enter the board followed by EOF (ctrl-d)"


boardstring = ''

while line = gets
  boardstring +=  line
end

boardstring = boardstring.chomp
puts "loading dictionary"
dict = Dictionary.new(DICTIONARY_PATH)
puts "loaded dictionary"
board = Board.new(boardstring, dict)
puts "building board"
board.print

puts "generating words"
words = board.generate_all_words

puts words
