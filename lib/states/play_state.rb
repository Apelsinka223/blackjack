# encoding: UTF-8
require_relative 'state'

module PlayState
  extend State

  class << self
    def check_state(game)
      unless game.is_a? Game
        raise "#{game} is not a Game"
      end

      if game.player.scores == Game::SCORE_21
        game.change_state(StopState)
      elsif game.player.scores > Game::SCORE_21
        game.player_loose
        game.change_state(FinishState)
      end
    end
  end

end