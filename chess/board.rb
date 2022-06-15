require_relative 'piece'
require_relative 'knight'
require_relative 'queen'
require_relative 'king'
require_relative 'rook'
require_relative 'pawn'
require_relative 'nullpiece'
require_relative 'bishop'
require 'colorize'
require 'byebug'

class Board

  ALL_SQUARES = (0..7).to_a.product((0..7).to_a)

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
        if i == 7
          if j == 0 || j == 7
            self[pos] = Rook.new(:black, self, pos)
          elsif j == 1 || j == 6
            self[pos] = Knight.new(:black, self, pos)
          elsif j == 2 || j == 5
            self[pos] = Bishop.new(:black, self, pos)
          elsif j == 3
            self[pos] = King.new(:black, self, pos)
          elsif j == 4
            self[pos] = Queen.new(:black, self, pos)
          end
        elsif i == 6
          self[pos] = Pawn.new(:black, self, pos)
        elsif i == 1
          self[pos] = Pawn.new(:white, self, pos)
        elsif i == 0
          if j == 0 || j == 7
            self[pos] = Rook.new(:white, self, pos)
          elsif j == 1 || j == 6
            self[pos] = Knight.new(:white, self, pos)
          elsif j == 2 || j == 5
            self[pos] = Bishop.new(:white, self, pos)
          elsif j == 4
            self[pos] = King.new(:white, self, pos)
          elsif j == 3
            self[pos] = Queen.new(:white, self, pos)
          end
        end
      end
    end

    # self[[2,6]] = King.new(:black, self, [2,6] )
    # self[[3,6]] = Rook.new(:white, self, [3,6] )

    # p self[[1,5]].moves

    self[[1,4]] = NullPiece.instance
    self[[6,4]] = NullPiece.instance

  end

  def display
    a = (0..7).to_a
    a = a.map {|el| el.to_s.green}
    puts "  | #{a.join(" | ")}"
    @row.each_with_index do |el,i|
      puts "--+---+---+---+---+---+---+---+---"
      puts "#{i.to_s.green} | #{el.join(" | ")}"
    end
    puts "--+---+---+---+---+---+---+---+---"
    puts
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos] == NullPiece.instance # || cannot move to end_pos
      raise "Cannot move there!"
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance 

  end

  def in_check?(color)
    king_pos = ALL_SQUARES.select do |pos|
      self[pos].symbol == :K && self[pos].color == color
    end
    king_pos = king_pos.flatten
    other_team_color = color == :black ? :white : :black
    return all_valid_moves(other_team_color).include?(king_pos)
  end

  def all_valid_moves(color)
    team_pos = ALL_SQUARES.select do |pos|
      self[pos].color == color
    end

    all_team_moves = []
    team_pos.each do |square|
      all_team_moves += self[square].moves
    end

    return all_team_moves
  end


  private
  attr_reader :null_piece
  
  
end


a = Board.new
a.display
p a.in_check?(:white)

