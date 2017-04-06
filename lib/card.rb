class Card
  attr_accessor :rank, :suit, :is_opened

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
  RANK_J = 'J'
  RANK_Q = 'Q'
  RANK_K = 'K'
  RANK_A = 'A'

  SCORE_RANK_TITLES = 10
  SCORE_RANK_A_MIN = 1
  SCORE_RANK_A_MAX = 11


  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @is_opened = false
  end

  def getScore(handScores = 0)
    case @rank
      when RANK_2..RANK_10 then
        return @rank
      when RANK_J, RANK_Q, RANK_K
        return SCORE_RANK_TITLES
      when RANK_A
        if handScores >= Game::SCORE_21
          return SCORE_RANK_A_MAX
        else
          return SCORE_RANK_A_MIN
        end
    end
  end
end