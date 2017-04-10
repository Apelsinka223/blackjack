# encoding: UTF-8
module State
  include Log
  WIN_RATE = 1

  def check_state(game)
    unless game.is_a? Game
      raise "#{game} is not a Game"
    end

    raise 'Not implemented'
  end

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

  def after_change(game); end
end