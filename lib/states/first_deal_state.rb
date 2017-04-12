# encoding: UTF-8
require_relative 'state'

module FirstDealState
  extend State

  WIN_RATE = 1.5

  class << self
    # Check if game state must change
    # @param [Game] game
    def check_state(game)
      raise "#{game} is not a Game" unless game.is_a? Game

    if game.player.scores == Game::SCORE_21
        game.player_win(WIN_RATE)
        return game.change_state(StopState)
      elsif game.player.scores > Game::SCORE_21
        game.player_loose
        return game.change_state(FinishState)
      end

      game.change_state(PlayState)
    end

    # Initialize hands,
    # reset result, substructs bet from balance,
    # deal first cards by hands
    def after_change(game)
      raise "#{game} is not a Game" unless game.is_a? Game
      game.set_hands
      game.player.add_card(game.deck.get_card)
      game.player.add_card(game.deck.get_card)
      game.dealer.add_card(game.deck.get_card)
      game.dealer.add_card(game.deck.get_card, false)
    end
  end
end