# encoding: UTF-8
class Deck
  attr_accessor :cards

  ENOUGH_SCORE = 42

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

  def has_enough_cards?
    @cards.reduce(0) { |sum, card| sum + card.get_score} >= ENOUGH_SCORE
  end
end