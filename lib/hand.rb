class Hand
  attr_accessor :cards, :scores

  def initialize()
    @cards = []
    @scores = 0
  end

  def addCard(card, open = true)
    card.is_opened = open
    @cards.push(card)
    addScores(card)
  end

  def addScores(card)
    @scores += card.getScore(@scores)
  end
end