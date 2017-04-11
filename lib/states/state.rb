# encoding: UTF-8
module State
  include Log
  WIN_RATE = 1

  # Check if game state must change
  # @param [Game] game
  def check_state(game)
    unless game.is_a? Game
      raise "#{game} is not a Game"
    end

    raise 'Not implemented'
  end

  # Return available choices for player
  # @return [Hash]
  def get_choices(game)
    unless game.is_a? Game
      raise "#{game} is not a Game"
    end

    choices = {
      :take_card => 'Взять карту',
      :stop => 'Стоп',
    }
    if game.balance > game.bet
      choices[:double_bet] = 'Удвоить ставку'
    end
    choices
  end

  # Trigger after game state changes on current
  # @param [Game] game
  def after_change(game); end
end