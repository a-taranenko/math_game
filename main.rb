require './game'
require './question'
require './player'

module MathGame
  new_game = Game.new("John", "Rob")
  new_game.start_game
end
