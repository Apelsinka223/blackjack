# encoding: UTF-8
class Game
  include Singleton
  include Log

  attr_reader :player, :dealer, :deck, :balance, :bet, :state, :result
  private_class_method :new

  SCORE_21 = 21
  SCORE_DEALER_STOP = 17
  START_BALANCE = 1000

  def initialize
    logger.info 'Start'
    @balance = START_BALANCE
    @deck = Deck.new
    @state = StartState
  end

  def make_bet(bet)
    if bet <= 0 or bet > @balance
      return 'Ставка должна быть больше 0 и меньше баланса'
    end

    @bet = bet
  end

  def double_bet
    @balance -= @bet
    @bet *= 2
  end

  def take_card(hand)
    unless hand.is_a? Hand
      raise "#{hand} is not a Hand"
    end

    hand.add_card(@deck.get_card)
    @state.check_state(self)
  end

  def start_game
    @result = nil
    @balance -= @bet
    @player = Hand.new(:player)
    @dealer = Hand.new(:dealer)

    @player.add_card(@deck.get_card)
    @player.add_card(@deck.get_card)
    @dealer.add_card(@deck.get_card)
    @dealer.add_card(@deck.get_card, false)

    change_state(FirstDealState)
  end

  def restart_game
    @balance = START_BALANCE
    @deck = Deck.new
    @bet = nil
    @result = nil
    @state = StartState
  end

  def player_win(rate)
    unless rate.is_a? Numeric
      raise "#{rate} is not Numeric"
    end
    if rate < 0
      raise 'Rate must be greater than 0'
    end

    @result = :win
    @balance += (rate * 2 * @bet).to_i
  end

  def player_loose
    @result = :loose
  end

  def stay
    @result = :stay
    @balance += @bet
  end

  def get_choices
    @state.check_state(self)
    @state.get_choices(self)
  end

  def change_state(state)
    unless state.is_a? State
      raise "#{state} is not a State"
    end

    logger.info "State change from #{@state} to #{state}"
    @state = state
    @state.after_change(self)
    @state.check_state(self)
  end

  def has_choice?(choice)
    @state.get_choices(self).has_key? choice
  end

end