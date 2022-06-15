#require_relative 'board'
#require_relative 'nullpiece'
require 'byebug'
class Piece

  attr_reader :pos, :board, :color

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def symbol
    return :P
  end


  def to_s
    if @color == :black
      return self.symbol.to_s.red
    else
      return self.symbol.to_s
    end
  end

  def valid_moves # Returns an array of potential final positions

  end

  def empty?(pos)
    #debugger
    return true if @board[pos] == NullPiece.instance
    false
  end

end