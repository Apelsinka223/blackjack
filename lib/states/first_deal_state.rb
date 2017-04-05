class FirstDealState
  include State

  WIN_RATE = 1.5

  def initialize(game)
    super
  end

  def checkState
    if @game.player.scores = Game::SCORE_21
        @game.addWin(WIN_RATE)
    end
    @state = PlayState.new(@game)
  end
end