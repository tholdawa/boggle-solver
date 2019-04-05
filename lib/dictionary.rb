require_relative 'stringtree'

class Dictionary
  def initialize(filename)
    @words = StringTree.new
    File.open(filename,'r').each { |line| self.add_word(line.chomp) }
  end

  def add_word(word)
    unless word =~ /^[A-Z]/
      @words.insert(word)
    end
  end

  def list_words
    return @words.list_words
  end

  def is_word(w)
    return @words.is_word(w)
  end

  def is_prefix_of_word(w)
    return @words.is_prefix_of_word(w)
  end
end
