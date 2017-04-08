# encoding: UTF-8
require_relative 'log'
class Hand
  include Log
  attr_accessor :cards, :scores, :name

  def initialize(name)
    @cards = []
    @scores = 0
    @name = name
  end

  def add_card(card, open = true)
    unless card.is_a? Card
      raise "#{card} is not a Card"
    end
    unless !!open == open
      raise "#{open} is not a Boolean"
    end

    card.is_opened = open
    @cards.push(card)
    add_scores(card)

    logger.info "Card #{card} added to #{self}"
  end

  def add_scores(card)
    unless card.is_a? Card
      raise "#{card} is not a Card"
    end

    @scores += card.get_score(@scores)
    logger.info "Scores #{self}: #{@scores}"
  end

  def open_cards
    @cards.each{ |card| card.is_opened = true }
  end

  def get_open_scores
    @cards.reduce(0) { |sum, card| card.is_opened ? sum += card.get_score : sum }
  end

  def to_s
    "#{@name}"
  end
end