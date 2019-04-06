# frozen_string_literal: true

class StringTree
  def initialize
    @tree = {}
    @is_word = false
  end

  def insert(word)
    if word.empty?
      @is_word = true
    else
      head = word[0]
      tail = word[1..-1]
      @tree[head] = @tree[head] || StringTree.new
      @tree[head].insert(tail)
    end
  end

  def is_word(word)
    if word.empty?
      @is_word
    else
      head = word[0]
      tail = word[1..-1]
      @tree[head]&.is_word(tail)
    end
  end

  def is_prefix_of_word(word)
    if word.empty?
      true
    else
      head = word[0]
      tail = word[1..-1]
      @tree[head]&.is_prefix_of_word(tail)
    end
  end

  def list_words
    set = []
    _list_words('', set)
    set
  end

  def _list_words(prefix, set)
    set << prefix if @is_word
    @tree.each { |letter, subtree| subtree._list_words("#{prefix}#{letter}", set) }
  end
end
