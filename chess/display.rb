require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display

  attr_reader :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    self.render
  end

  def render
    while true
      system("clear")
      (0..7).each do |row|
        arr = []
        (0..7).each do |col|
          string_val = @board[[row,col]].to_s
          string_val = string_val.colorize(:background => :red) if @cursor.cursor_pos == [row,col]
          arr << string_val
        end
        puts arr.join(" ")
      end
      @cursor.get_input
    end
  
 
  end

end

d = Display.new(Board.new)