class Game
  attr_accessor :player, :dealer, :deck, :balance, :bet, :state, :win

  SCORE_21 = 21

  def initialize
    @player = Hand.new
    @dealer = Hand.new
    @balance = 1000
    @deck = Deck.new
    @bet = 0
    @state = FirstDealState.new(self)

    @player.addCard(@deck.cards.pop)
    @player.addCard(@deck.cards.pop)
    @dealer.addCard(@deck.cards.pop)
    @dealer.addCard(@deck.cards.pop, false)
  end

  def instance

  end

  def makeBet(bet)
    @balance -= bet
    @bet = bet
  end

  def takeCard(hand)
    hand.addCard(@deck.cards.pop)
  end

  def addWin(rate)
    @win = true
    @balance += rate * 2
  end

  def getChoices
    @state.checkState
    return @state.getChoices
  end
end