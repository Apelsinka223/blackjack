# encoding: UTF-8
require_relative 'state'

module FinishState
  extend State

  class << self
    def check_state(*); end

    # Return available choices for player
    # @return [Hash]
    def get_choices(game)
      raise "#{game} is not a Game" unless game.is_a? Game

      if game.balance > 0 and game.deck.has_enough_cards?
        {:new_game => 'Сдать карты'}
      else
        {:restart_game => 'Перезапустить игру'}
      end
    end

    # Trigger after game state changes on current
    # @param [Game] game
    def after_change(game)
      raise "#{game} is not a Game" unless game.is_a? Game
      game.dealer.open_cards
    end
  end
end