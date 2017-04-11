# encoding: UTF-8
class Deck
  ENOUGH_SCORE = 42

  # Create deck with all 52 cards
  # and shuffle it
  def initialize
    @cards = [
        Card.new(Card::RANK_2, Card::SUIT_HEARTS),
        Card.new(Card::RANK_3, Card::SUIT_HEARTS),
        Card.new(Card::RANK_4, Card::SUIT_HEARTS),
        Card.new(Card::RANK_5, Card::SUIT_HEARTS),
        Card.new(Card::RANK_6, Card::SUIT_HEARTS),
        Card.new(Card::RANK_7, Card::SUIT_HEARTS),
        Card.new(Card::RANK_8, Card::SUIT_HEARTS),
        Card.new(Card::RANK_9, Card::SUIT_HEARTS),
        Card.new(Card::RANK_10, Card::SUIT_HEARTS),
        Card.new(Card::RANK_J, Card::SUIT_HEARTS),
        Card.new(Card::RANK_Q, Card::SUIT_HEARTS),
        Card.new(Card::RANK_K, Card::SUIT_HEARTS),
        Card.new(Card::RANK_A, Card::SUIT_HEARTS),
        Card.new(Card::RANK_2, Card::SUIT_CLUBS),
        Card.new(Card::RANK_3, Card::SUIT_CLUBS),
        Card.new(Card::RANK_4, Card::SUIT_CLUBS),
        Card.new(Card::RANK_5, Card::SUIT_CLUBS),
        Card.new(Card::RANK_6, Card::SUIT_CLUBS),
        Card.new(Card::RANK_7, Card::SUIT_CLUBS),
        Card.new(Card::RANK_8, Card::SUIT_CLUBS),
        Card.new(Card::RANK_9, Card::SUIT_CLUBS),
        Card.new(Card::RANK_10, Card::SUIT_CLUBS),
        Card.new(Card::RANK_J, Card::SUIT_CLUBS),
        Card.new(Card::RANK_Q, Card::SUIT_CLUBS),
        Card.new(Card::RANK_K, Card::SUIT_CLUBS),
        Card.new(Card::RANK_A, Card::SUIT_CLUBS),
        Card.new(Card::RANK_2, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_3, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_4, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_5, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_6, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_7, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_8, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_9, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_10, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_J, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_Q, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_K, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_A, Card::SUIT_DIAMONDS),
        Card.new(Card::RANK_2, Card::SUIT_SPADES),
        Card.new(Card::RANK_3, Card::SUIT_SPADES),
        Card.new(Card::RANK_4, Card::SUIT_SPADES),
        Card.new(Card::RANK_5, Card::SUIT_SPADES),
        Card.new(Card::RANK_6, Card::SUIT_SPADES),
        Card.new(Card::RANK_7, Card::SUIT_SPADES),
        Card.new(Card::RANK_8, Card::SUIT_SPADES),
        Card.new(Card::RANK_9, Card::SUIT_SPADES),
        Card.new(Card::RANK_10, Card::SUIT_SPADES),
        Card.new(Card::RANK_J, Card::SUIT_SPADES),
        Card.new(Card::RANK_Q, Card::SUIT_SPADES),
        Card.new(Card::RANK_K, Card::SUIT_SPADES),
        Card.new(Card::RANK_A, Card::SUIT_SPADES)
    ]
    @cards = @cards.shuffle
  end

  # Return if cards in deck
  # are enough to continue the game
  # @return [True|False]
  def has_enough_cards?
    @cards.reduce(0) { |sum, card| sum + card.get_score} >= ENOUGH_SCORE
  end

  # Return next card from deck
  # @return [Card]
  def get_card
    @cards.pop
  end
end