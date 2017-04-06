require_relative 'state'

class FirstDealState < State

  WIN_RATE = 1.5

  def checkState
    if @game.player.scores = Game::SCORE_21
        @game.playerWin(WIN_RATE)
    end
    @state = PlayState.new(@game)
  end
end