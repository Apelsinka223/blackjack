require_relative 'state'

class FinishState < State

  WIN_RATE = 1

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