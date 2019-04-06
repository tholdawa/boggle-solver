# frozen_string_literal: true

require_relative 'dictionary'

# Board class represents the layout of a board in the game of boggle.
# It is initialized with a string representing the letters of the board,
# with the rows of the board delimited by newline characters.
class Board
  def cardinalities
    [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ]
  end

  def initialize(string, dictionary)
    @board = string.lines.map(&:chomp).map(&:chars)
    throw 'Board must all be the same length' unless @board.map(&:length).uniq.length == 1
    @size_x = @board.length
    @size_y = @board[0].length

    @dictionary = dictionary
  end

  def print
    @board.each { |l| puts l.join ' ' }
  end

  def within_bounds(x_coord, y_coord)
    x_coord >= 0 && x_coord < @size_x &&
      y_coord >= 0 && y_coord < @size_y
  end

  def letter_at(x_coord, y_coord)
    @board[x_coord][y_coord]
  end

  def generate_words(start_x, start_y)
    _generate_words(start_x, start_y, '', [], [])
  end

  def _generate_words(x_coord, y_coord, prefix, words, visited)
    prefix = "#{prefix}#{letter_at(x_coord, y_coord)}"
    if @dictionary.word?(prefix)
      # puts "#{prefix} was a word"
      words << prefix
    end
    visited += [[x_coord, y_coord]]
    # puts "generating words for  (#{x_coord}, #{y_coord}) - prefix #{prefix}"
    # puts "Visited: #{visited.inspect}"
    cardinalities.each do |card|
      new_x = x_coord + card[0]
      new_y = y_coord + card[1]
      if within_bounds(new_x, new_y) && !visited.include?([new_x, new_y]) &&
         @dictionary.prefix_of_word?(prefix)
        _generate_words(new_x, new_y, prefix, words, visited)
      end
    end
    words
  end

  def generate_all_words
    (0..@size_x - 1).to_a.product((0..@size_y - 1).to_a).map do |(x_coord, y_coord)|
      # puts "Generating all words for coordinates #{x_coord}, #{y_coord}"
      generate_words(x_coord, y_coord)
    end
                    .flatten
                    .sort
                    .uniq
  end
end
