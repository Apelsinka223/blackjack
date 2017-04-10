# encoding: UTF-8
require_relative 'state'

module StopState
  extend State

  class << self
    def check_state(game)
      unless game.is_a? Game
        raise "#{game} is not a Game"
      end

      if game.dealer.scores > 21
        game.player_win(WIN_RATE)
      elsif game.dealer.scores == game.player.scores
        game.stay
      elsif game.dealer.scores < game.player.scores
        game.player_win(WIN_RATE)
      elsif game.dealer.scores > game.player.scores
        game.player_loose
      end
      game.change_state(FinishState)
    end

    def get_choices(*)
      {}
    end

    def after_change(game)
      game.dealer.open_cards
      while game.dealer.scores < Game::SCORE_DEALER_STOP do
        game.take_card(game.dealer)
      end
    end
  end
end