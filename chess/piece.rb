# require_relative 'board'

class Piece

  attr_reader :pos, :board, :color

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    if @color == :black
      return "P".red
    else
      return "P"
    end
  end

  def valid_moves # Returns an array of potential final positions

  end

  def empty?(pos)
    # return true if @board[pos] == NullPiece.instance
    false
  end

end