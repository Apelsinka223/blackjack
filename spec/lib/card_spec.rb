require 'spec_helper'
require 'card'

describe Card, '.new' do
  context 'when passed correct rank and suit' do
    subject(:card) { Card.new(Card::RANK_2, Card::SUIT_CLUBS) }
    it 'creates a card' do
      expect(card).is_a? Card
    end

    it 'with correct attributes' do
      expect(card.rank).to eq Card::RANK_2
      expect(card.suit).to eq Card::SUIT_CLUBS
    end

    it 'closed by default' do
      expect(card.is_opened).to eq false
    end
    end

  context 'when passed incorrect' do
    it 'rank - raises error' do
      expect{ Card.new(1, Card::SUIT_CLUBS) }.to raise_error(RuntimeError, 'Unknown rank 1')
    end
    it 'suit - raises error' do
      expect{ Card.new(Card::RANK_2, 1) }.to raise_error(RuntimeError, 'Unknown suit 1')
    end
  end
end