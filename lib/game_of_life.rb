# frozen_string_literal: true

require_relative "game_of_life/screen"
require_relative "game_of_life/game"

module GameOfLife
  game = Game.random(width: 100, height: 100)
  Screen.new(game).start!
end
