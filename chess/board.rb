require_relative 'piece'
require_relative 'knight'
require_relative 'queen'
require_relative 'king'
require_relative 'rook'
require_relative 'pawn'
require_relative 'nullpiece'
require_relative 'bishop'

class Board

  def [](pos) #pos is a pair inside an array
    @row[pos[0]][pos[1]]
  end

  def []=(pos,value)
    @row[pos[0]][pos[1]] = value
  end

  # INITIALIZATION 
  def initialize
    @row = Array.new(8) {Array.new(8, NullPiece.instance)}
    # @null_piece = null_piece

    nums = [0,1,6,7]
    nums.each do |i|
      @row[i].each.with_index do |ele, j|
        pos = [i,j]
        self[pos] = Piece.new(nil, nil, pos)
      end
    end
  end

  def display
    @row.each do |el|
      puts el.join(" ")
    end
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos] == NullPiece.instance # || cannot move to end_pos
      raise "Cannot move there!"
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance 

  end


  
  private
  attr_reader :null_piece
  
  
  
  
end


a = Board.new
a.display
a.move_piece([4,4], [0,0])
a.display
