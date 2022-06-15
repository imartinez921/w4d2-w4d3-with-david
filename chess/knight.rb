require_relative 'piece'
require_relative 'steppable'

class Knight < Piece
    include Steppable

    def symbol
        return :N
    end
  
    private
    def move_dirs
      symbol
    end
end