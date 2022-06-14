

module Slideable

  HORIZONTAL_DIRS = [
    [0,1],
    [0,2],
    [0,3],
    [0,4],
    [0,5],
    [0,6],
    [0,7],
    [0,-1],
    [0,-2],
    [0,-3],
    [0,-4],
    [0,-5],
    [0,-6],
    [0,-7]
  ]
  DIAGONAL_DIRS = [
    [1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],
    [-1,-1],
    [-2,-2],
    [-3,-3],
    [-4,-4],
    [-5,-5],
    [-6,-6],
    [-7,-7],
    [-1,1],
    [-2,2],
    [-3,3],
    [-4,4],
    [-5,5],
    [-6,6],
    [-7,7],
    [1,-1],
    [2,-2],
    [3,-3],
    [4,-4],
    [5,-5],
    [6,-6],
    [7,-7]
  ]


  def moves 
    potential_moves = []
    direction = move_dirs #array eg. [true, true]
    if direction[0]
      HORIZONTAL_DIRS.each do |dir|
        row = self.pos[0] + dir[0]
        col = self.pos[1] + dir[1]
        potential_moves << [row,col] if (0..7).include?(row) && (0..7).include?(col)
      end
    end
    return potential_moves
  end




end