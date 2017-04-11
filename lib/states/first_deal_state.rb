# encoding: UTF-8
require_relative 'state'

module FirstDealState
  extend State

  WIN_RATE = 1.5

  class << self
    # Check if game state must change
    # @param [Game] game
    def check_state(game)
      unless game.is_a? Game
        raise "#{game} is not a Game"
      end

      if game.player.scores == Game::SCORE_21
        game.player_win(WIN_RATE)
        return game.change_state(StopState)
      elsif game.player.scores > Game::SCORE_21
        game.player_loose
        return game.change_state(FinishState)
      end

      game.change_state(PlayState)
    end
  end
end