# encoding: UTF-8
#
# Instance Game holds main objects
# that take part in the game
class Game
  include Log
  attr_reader :player, :dealer, :deck, :balance, :bet, :state, :result

  SCORE_21 = 21
  SCORE_DEALER_STOP = 17
  START_BALANCE = 1000

  # Return already existing instance
  def self.instance
    @instance ||= new
  end

  # Initialize Game
  # with full Deck, start balance
  # and state = StartState
  def initialize
    logger.info 'Start'
    @balance = START_BALANCE
    @deck = Deck.new
    @state = StartState
  end

  # Sets bet if bet is valid
  # and make first deal
  # or returns error
  # @param [Integer] bet
  # @return [Integer|String]
  def make_bet(bet)
    if bet <= 0 or bet > @balance
      return 'Ставка должна быть больше 0 и меньше баланса'
    end

    @bet = bet
    first_deal
  end

  # Double current bet
  def double_bet
    @balance -= @bet
    @bet *= 2
  end

  # Deal card from deck to hand
  # @param [Hand] hand
  def take_card(hand)
    unless hand.is_a? Hand
      raise "#{hand} is not a Hand"
    end

    hand.add_card(@deck.get_card)
    @state.check_state(self)
  end

  def start_game
    @result = nil
    change_state(StartState)
  end

  # Initialize hands,
  # reset result, substructs bet from balance,
  # deal first cards by hands
  def first_deal
    @balance -= @bet
    @player = Hand.new(:player)
    @dealer = Hand.new(:dealer)

    @player.add_card(@deck.get_card)
    @player.add_card(@deck.get_card)
    @dealer.add_card(@deck.get_card)
    @dealer.add_card(@deck.get_card, false)

    change_state(FirstDealState)
  end

  # Reset all game arguments
  def restart_game
    @balance = START_BALANCE
    @deck = Deck.new
    @bet = nil
    @result = nil
    @state = StartState
  end

  # Raise player balance by current state rate
  # and fill the result
  # @param [Integer] rate
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

  # Fill the result
  def player_loose
    @result = :loose
  end

  # Raise player balance by bet
  # and fill the result
  def stay
    @result = :stay
    @balance += @bet
  end

  # Return available choices
  # @return [Hash]
  def get_choices
    @state.check_state(self)
    @state.get_choices(self)
  end

  # Change state
  # @param [State] state
  def change_state(state)
    unless state.is_a? State
      raise "#{state} is not a State"
    end

    logger.info "State change from #{@state} to #{state}"
    @state = state
    @state.after_change(self)
    @state.check_state(self)
  end

  # Check if choice is available
  # @param [Symbol] choice
  def has_choice?(choice)
    @state.get_choices(self).has_key? choice
  end

end