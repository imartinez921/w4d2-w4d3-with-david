require_relative "piece"
require "byebug"


class Pawn < Piece

  def symbol
    return :P
  end

  def moves
    potential_moves = []
    potential_moves += side_attacks
    potential_moves += forward_steps
    return potential_moves
  end

  def test
    moves
  end

  private
  def at_start_row?
    self.pos[0] == 1 || self.pos[0] == 6
  end

  def forward_dir #return 1 or -1
    @color == :black ? -1 : 1
  end

  def forward_steps
    viable_moves = []
    step_forward = [pos[0] + forward_dir, pos[1]] #pair
    two_steps_forward = [pos[0] + 2*forward_dir, pos[1]]
    if self.empty?(step_forward)
      viable_moves << step_forward
      viable_moves << two_steps_forward if self.empty?(two_steps_forward)
    end
    return viable_moves
  end


  def side_attacks #only attack forward
    side1 = [pos[0] + forward_dir, pos[1] + 1]
    side2 = [pos[0] + forward_dir, pos[1] + -1]
    sides = []
    sides << side1 if ALL_SQUARES.include?(side1)
    sides << side2 if ALL_SQUARES.include?(side2)

    viable_sides = []
    sides.each do |side|
      #debugger
      if !self.empty?(side) && @board[side].color != self.color
        viable_sides << side
      end
    end

    viable_sides
  end


end