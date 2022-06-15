require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def symbol
    return :Q
  end


  private
    def move_dirs
      return [true, true]
    end

end



# r = Queen.new(nil, nil, [0,0])
# p r.moves