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
      a = (0..7).to_a
      a = a.map {|el| el.to_s.green}
      puts "  | #{a.join(" | ")}"
      puts "--+---+---+---+---+---+---+---+---"
      (0..7).each do |row|
        arr = []
        (0..7).each do |col|
          string_val = " " + @board[[row,col]].to_s + " "
          string_val = string_val.colorize(:background => :green) if @cursor.cursor_pos == [row,col]
          arr << string_val
        end
        puts "#{row.to_s.green} |#{arr.join("|")}"
        puts "--+---+---+---+---+---+---+---+---"
      end
      @cursor.get_input
    end
  
 
  end

end

d = Display.new(Board.new)