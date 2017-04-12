# encoding: UTF-8
require_relative 'state'

module PlayState
  extend State

  class << self
    # Check if game state must change
    # @param [Game] game
    def check_state(game)
      raise "#{game} is not a Game"  unless game.is_a? Game

      if game.player.scores == Game::SCORE_21
        game.change_state(StopState)
      elsif game.player.scores > Game::SCORE_21
        game.player_loose
        game.change_state(FinishState)
      end
    end
  end

end