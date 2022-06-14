class Piece

  attr_reader :pos

  def initialize (color, board, pos)
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

end