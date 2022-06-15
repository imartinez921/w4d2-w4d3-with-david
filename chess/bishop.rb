require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  def symbol
    return :B
  end


  private
  def move_dirs
    return [false, true]
  end


end

# r = Bishop.new(nil, nil, [0,0])
# p r.moves
