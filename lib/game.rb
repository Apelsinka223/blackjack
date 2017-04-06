class Game
  include Singleton

  attr_accessor :player, :dealer, :deck, :balance, :bet, :state, :result
  private_class_method :new

  SCORE_21 = 21

  def initialize
    @balance = 1000
    @deck = Deck.new
    @bet = 0
    puts 10
    puts @balance

    firstDeal
  end


  def makeBet(bet)
    @bet = bet
  end

  def takeCard(hand)
    hand.addCard(@deck.cards.pop)
  end

  def firstDeal
    @player = Hand.new
    @dealer = Hand.new
    @state = FirstDealState.new(self)

    @player.addCard(@deck.cards.pop)
    @player.addCard(@deck.cards.pop)
    @dealer.addCard(@deck.cards.pop)
    @dealer.addCard(@deck.cards.pop, false)
  end

  def playerWin(rate)
    @win = true
    @balance += rate * 2 * @bet
    @state = FinishState.new(self)
  end

  def playerLoose
    @result = :loose
    @balance -= @bet
    @state = FinishState.new(self)
  end

  def stay
    @result = :win
    @state = FinishState.new(self)
  end

  def getChoices
    @state.checkState
    return @state.getChoices
  end

  def restartGame
    @@instance = new
  end
end