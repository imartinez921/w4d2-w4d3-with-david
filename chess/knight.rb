require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
    include Stepable

    def symbol
        return :N
    end
  

end