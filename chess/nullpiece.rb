require_relative './piece.rb'
require 'singleton'

class NullPiece < Piece
    include Singleton

  def initialize
  end

  def moves
  end

  def color
    nil
  end

  def symbol
    nil
  end

  def to_s
    return " "
  end

end