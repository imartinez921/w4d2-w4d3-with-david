require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
    include Slideable

  private
  def move_dirs
    return [false, true]
  end


end