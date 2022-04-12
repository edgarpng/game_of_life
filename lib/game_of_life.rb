# frozen_string_literal: true

require_relative "game_of_life/version"
require_relative "game_of_life/screen"

module GameOfLife
  Screen.new.start!
end
