# frozen_string_literal: true

require_relative 'stringtree'

class Dictionary
  def initialize(filename)
    @words = StringTree.new
    File.open(filename, 'r').each { |line| add_word(line.chomp) }
  end

  def add_word(word)
    @words.insert(word) unless /^[A-Z]/.match?(word)
  end

  def list_words
    @words.list_words
  end

  def is_word(w)
    @words.is_word(w)
  end

  def is_prefix_of_word(w)
    @words.is_prefix_of_word(w)
  end
end
