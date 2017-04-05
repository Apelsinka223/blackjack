class FinishState
  include State

  WIN_RATE = 1

  def initialize(game)
    super
  end

  def checkState
  end

  def getChoices
    if @game.balance > 0
      return [
        :new_game
     ]
    end
  end
end