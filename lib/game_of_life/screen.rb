class GameOfLife::Screen
  REFRESH_RATE_IN_SECONDS = 0.5
  PIXEL_OFF = "⬛"
  PIXEL_ON = "⬜"

  attr_reader :game

  def initialize(game)
    @game = game
  end

  def start!
    loop do
      clear
      draw
      next_frame
      sleep(REFRESH_RATE_IN_SECONDS)
    end
  rescue Interrupt
    puts "Thanks for playing!"
  end

  private

  attr_reader :width, :height

  def draw
    board = game.board
    board.map(&method(:to_pixel_value)).each_slice(board.row_size) do |row|
      puts row.join
    end
  end

  def next_frame
    game.tick
  end

  def to_pixel_value(cell)
    cell ? PIXEL_ON : PIXEL_OFF
  end

  def clear
    # From https://stackoverflow.com/questions/3170553/how-can-i-clear-the-terminal-in-ruby
    puts "\e[H\e[2J"
  end
end
