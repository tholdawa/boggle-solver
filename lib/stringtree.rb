# frozen_string_literal: true

# StringTree class implements a radix tree data structure for efficiently
# querying a large set of strings for membership or prefixing. Each node
# contains a list of characters that point to StringTree subtrees, and a
# boolean indicating if the path from the root node up to (but not including)
# this node is a word belonging to the set of words. Thus, after initialization,
# each leaf node will be an empty string tree with the @is_word indicator true.
# To determine if a string is the prefix of a word in the set (and so might
# someday become a word in the set if we keep appending characters), we can just
# determine if there is a path from the root node containing those characters
# in order.
#
# StringTree representing the set of words {BAR, FOX, FOO, FOOD, A}
#
#                       Root Node
#                    (B)   (F)    (A)
#                    /      |       \
#                  (A)     (O)      *()
#                  /      /   \
#                (R)    (X)   (O)
#                /      /       \
#              *()   *()       *(D)
#                                 \
#                                 *()
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

  def word?(word)
    if word.empty?
      @is_word
    else
      head = word[0]
      tail = word[1..-1]
      @tree[head]&.word?(tail)
    end
  end

  def prefix_of_word?(word)
    if word.empty?
      true
    else
      head = word[0]
      tail = word[1..-1]
      @tree[head]&.prefix_of_word?(tail)
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
