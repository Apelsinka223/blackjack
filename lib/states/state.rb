class State

  def initialize(game)
    @game = game
  end

  def checkState
    raise 'Not implemented'
  end

  def getChoices
    return [
        :take_card,
        :double_bet,
        :stop
    ]
  end
end