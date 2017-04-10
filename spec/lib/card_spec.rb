require 'spec_helper'
require 'card'
require 'game'
require 'singleton'

describe Card, '.new' do
  context 'when passed correct rank and suit' do
    subject(:card) { Card.new(2, :clubs) }
    it 'creates a card' do
      expect(card).is_a? Card
    end

    it 'with correct attributes' do
      expect(card.rank).to eq 2
      expect(card.suit).to eq :clubs
    end

    it 'closed by default' do
      expect(card.is_opened).to eq false
    end
  end

  context 'when passed incorrect' do
    it 'rank - raises error' do
      expect { Card.new(1, :clubs) }.to raise_error(RuntimeError, 'Unknown rank 1')
    end
    it 'suit - raises error' do
      expect { Card.new(2, 1) }.to raise_error(RuntimeError, 'Unknown suit 1')
    end
  end
end

describe Card, '#get_score' do
  context 'count card score correctly for digit rank' do
    it 'with zero scores in hand' do
      card = Card.new(2, :clubs)
      expect(card.get_score).to eq 2
    end

    it 'with some scores in hand' do
      card =Card.new(2, :clubs)
      expect(card.get_score(10)).to eq 2
    end
  end
  
  context 'count card score correctly for titles rank' do
    it 'with zero scores in hand' do
      card =Card.new('K', :clubs)
      expect(card.get_score).to eq 10
    end

    it 'with some scores in hand' do
      card =Card.new('K', :clubs)
      expect(card.get_score(10)).to eq 10
    end
  end

  context 'count card score correctly for A' do
    it 'with zero scores in hand' do
      card =Card.new('A', :clubs)
      expect(card.get_score).to eq 11
    end

    it 'with some scores in hand' do
      card =Card.new('A', :clubs)
      expect(card.get_score(10)).to eq 1
    end
  end
end