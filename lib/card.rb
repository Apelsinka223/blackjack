# encoding: UTF-8

require_relative 'game'
class Card
  attr_accessor :is_opened
  attr_reader :rank, :suit

  SUIT_HEARTS = :hearts
  SUIT_CLUBS = :clubs
  SUIT_DIAMONDS = :diams
  SUIT_SPADES = :spades

  RANK_2 = 2
  RANK_3 = 3
  RANK_4 = 4
  RANK_5 = 5
  RANK_6 = 6
  RANK_7 = 7
  RANK_8 = 8
  RANK_9 = 9
  RANK_10 = 10
  RANK_J = :J
  RANK_Q = :Q
  RANK_K = :K
  RANK_A = :A

  SCORE_RANK_TITLES = 10
  SCORE_RANK_A_MIN = 1
  SCORE_RANK_A_MAX = 11

  RANKS = [
      RANK_2,
      RANK_3,
      RANK_4,
      RANK_5,
      RANK_6,
      RANK_7,
      RANK_8,
      RANK_9,
      RANK_10,
      RANK_J,
      RANK_Q,
      RANK_K,
      RANK_A,
  ]

  SUITS = [
      SUIT_HEARTS,
      SUIT_CLUBS,
      SUIT_DIAMONDS,
      SUIT_SPADES,
  ]

  # Checks fi rank and suit are valid
  #  and create card
  # @param [Integer|Symbol] rank
  # @param [Symbol] suit
  #
  def initialize(rank, suit)
    unless RANKS.include? rank
      raise "Unknown rank #{rank}"
    end
    unless SUITS.include? suit
      raise "Unknown suit #{suit}"
    end

    @rank = rank
    @suit = suit
    @is_opened = false
  end

  # Return card score
  # depend on hand available scores
  # @param [Integer] hand_scores
  def get_score(hand_scores = 0)
    unless hand_scores.is_a? Numeric
      raise 'Not numeric hand scores'
    end

    case @rank
    when RANK_2..RANK_10 then
      @rank
    when RANK_J, RANK_Q, RANK_K
      SCORE_RANK_TITLES
    when RANK_A
      if hand_scores >= Game::SCORE_21
        SCORE_RANK_A_MIN
      else
        SCORE_RANK_A_MAX
      end
    end
  end

  # Card to string
  def to_s
    "#{@rank}-#{@suit}"
  end
end