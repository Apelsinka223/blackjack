class PlayState
  include State

  def initialize(game)
    super
  end

  def checkState
    if @game.player.scores = Game::SCORE_21
      @game.state = StopState.new(@game)
    end
  end

  def getChoices
    super
  end
end