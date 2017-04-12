# encoding: UTF-8
require_relative 'log'
class Hand
  include Log
  attr_reader :cards, :scores, :name

  def initialize(name)
    @cards = []
    @scores = 0
    @name = name
  end

  # Add card to hand
  # and open/close it
  # @param [Card] card
  # @param [True|False] open
  def add_card(card, open = true)
    raise "#{card} is not a Card" unless card.is_a? Card
    raise "#{open} is not a Boolean" unless !!open == open

    card.is_opened = open
    @cards.push(card)
    add_scores(card)

    logger.info "Card #{card} added to #{self}"
  end

  # Add scores by card score
  # @param [Card] card
  def add_scores(card)
    raise "#{card} is not a Card" unless card.is_a? Card

    @scores += card.get_score(@scores)
    logger.info "Scores #{self}: #{@scores}"
  end

  # Open all cards in hand
  def open_cards
    @cards.each{ |card| card.is_opened = true }
  end

  # Return scores of all opened cards in hand
  def get_open_scores
    @cards.reduce(0) { |sum, card| card.is_opened ? sum += card.get_score : sum }
  end

  # Hand to string
  def to_s
    "#{@name}"
  end
end