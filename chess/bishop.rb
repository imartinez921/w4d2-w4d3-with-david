require_relative './piece.rb'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  private
    def move_dirs
      return [false, true]
    end


end

r = Bishop.new(nil, nil, [0,0])
p r.moves
