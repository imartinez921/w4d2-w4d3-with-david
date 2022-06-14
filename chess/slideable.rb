

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
    [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7]], #NE
    [[-1,-1],[-2,-2],[-3,-3],[-4,-4],[-5,-5],[-6,-6],[-7,-7]], #SE
    [[-1,1],[-2,2],[-3,3],[-4,4],[-5,5],[-6,6],[-7,7]], #SW
    [[1,-1],[2,-2],[3,-3],[4,-4],[5,-5],[6,-6],[7,-7]] #NW
  ]

  def moves 
    potential_moves = []
    direction = move_dirs #array eg. [true, true]

    if direction[0]
      HORIZONTAL_DIRS.each do |dir| #horizontal moves
        row = self.pos[0] + dir[0]
        col = self.pos[1] + dir[1]
        potential_moves << [row,col] if (0..7).include?(row) && (0..7).include?(col)
      end
      HORIZONTAL_DIRS.each do |dir| #vertical moves
        row = self.pos[0] + dir[1]
        col = self.pos[1] + dir[0]
        potential_moves << [row,col] if (0..7).include?(row) && (0..7).include?(col)
      end
    end

    if direction[1]
      DIAGONAL_DIRS.each do |dir| #diagonal moves
        blocked = false
        dir.each_with_index do |step, i|
          row = self.pos[0] + step[0]
          col = self.pos[1] + step[1]
    
          if !blocked  && (0..7).include?(row) && (0..7).include?(col)
            if !self.empty?([row,col])
              blocked = true
              potential_moves << [row,col] if board[[row,col]].color != self.color
            else
              potential_moves << [row,col] #if (0..7).include?(row) && (0..7).include?(col)
            end
          end
        end
      end
    end

    return potential_moves
  end




end