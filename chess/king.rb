require_relative 'piece'
require_relative 'steppable'
class King < Piece
    include Steppable

    def symbol
        return :K
    end


    private
    def move_dirs
      symbol
    end

end