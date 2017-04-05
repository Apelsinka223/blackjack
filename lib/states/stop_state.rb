class StopState
  include State

  def initialize(game)
    super
  end

  def checkState
    if @game.dealer.scores = Game::SCORE_21
      @game.state = StopState.new(@game)
    end
  end

  def getChoices
    return []
  end
end