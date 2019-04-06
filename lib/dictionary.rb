# frozen_string_literal: true

require_relative 'stringtree'

# Dictionary class represents a set of valid words. This class handles the loading
# of a dictionary file to a StringTree data structure, and delegates methods for
# querying the contents of the StringTree after initialization
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

  def word?(word)
    @words.word?(word)
  end

  def prefix_of_word?(word)
    @words.prefix_of_word?(word)
  end
end
