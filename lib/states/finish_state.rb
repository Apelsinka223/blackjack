# encoding: UTF-8
require_relative 'state'

module FinishState
  extend State

  class << self
    def check_state(*); end

    def get_choices(game)
      unless game.is_a? Game
        raise "#{game} is not a Game"
      end

      if game.balance >= game.bet and game.deck.has_enough_cards
        {:new_game => 'Сдать карты'}
      else
        {:restart_game => 'Перезапустить игру'}
      end
    end
  end
end