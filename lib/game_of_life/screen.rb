class GameOfLife::Screen
  REFRESH_RATE_IN_SECONDS = 2
  PIXEL_OFF = "⬛"
  PIXEL_ON = "⬜"

  def initialize(width: 100, height: 50)
    @width = width
    @height = height
  end

  def start!
    loop do
      clear
      draw
      sleep(REFRESH_RATE_IN_SECONDS)
    end
  rescue Interrupt
    puts "Thanks for playing!"
  end

  private

  attr_reader :width, :height

  def draw
    row = PIXEL_OFF * width
    height.times do
      puts row
    end
  end

  def clear
    # From https://stackoverflow.com/questions/3170553/how-can-i-clear-the-terminal-in-ruby
    puts "\e[H\e[2J"
  end
end
