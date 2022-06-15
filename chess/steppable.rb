
module Steppable

 KNIGHT_DIRS = [
          [1,2],
          [1,-2],
          [2,1],
          [2,-1],
          [-1,2],
          [-1,-2],
          [-2,1],
          [-2,-1]
  ].freeze 


  KING_DIRS = [
          [1,0],
          [1,1],
          [0,1],
          [-1,1],
          [-1,0],
          [-1,-1],
          [0,-1],
          [1,-1],
  ].freeze 


#       potential_positions = []
#       @Vector_sums.each do |el|
#           row = pos[0] + el[0]
#           col = pos[1] + el[1]
#           potential_positions << [row,col] if (0..7).include?(row) && (0..7).include?(col) 
#       end

  
  def moves
    potential_moves = []
    moves_array = (move_dirs == :N) ? KNIGHT_DIRS : KING_DIRS
    moves_array.each do |dir|
      row = self.pos[0] + dir[0]
      col = self.pos[1] + dir[1]
      if (0..7).include?(row) && (0..7).include?(col)
        potential_moves << [row,col] if self.empty?([row,col]) || board[[row,col]].color != self.color
      end
    end

    potential_moves
    
  end

end