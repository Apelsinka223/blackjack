require_relative 'state'

class StopState < State

  def checkState
    if @game.dealer.scores == Game::SCORE_21 and @game.player.scores == Game::SCORE_21
      @game.playerLoose
    end
  end

  def getChoices
    return []
  end
end