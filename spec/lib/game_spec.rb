# encoding: UTF-8
require 'spec_helper'
require 'log'
require 'card'
require 'logger'
require 'deck'
require_relative '../../lib/states/start_state'

describe Game, '#make_bet' do
  subject(:game) { Game.new }
  context 'when passed valid bet' do
    it 'returns a bet' do
      result = game.make_bet(10)
      expect(result).to eq 10
    end

    it 'sets a bet' do
      game.make_bet(10)
      expect(game.bet).to eq 10
    end
  end

  context 'when passed bet less than zero' do
    it 'returns error' do
      result = game.make_bet(-1)
      expect(result).to eq 'Ставка должна быть больше 0 и меньше баланса'
    end

    it 'didn`t set bet' do
      game.make_bet(-1)
      expect(game.bet).to eq nil
    end
  end

  context 'when passed bet more than balance' do
    it 'returns error' do
      result = game.make_bet(1001)
      expect(result).to eq 'Ставка должна быть больше 0 и меньше баланса'
    end

    it 'didn`t set bet' do
      game.make_bet(1001)
      expect(game.bet).to eq nil
    end
  end

  context 'when passed bet equal to balance' do
    it 'returns a bet' do
      result = game.make_bet(1000)
      expect(result).to eq 1000
    end

    it 'sets a bet' do
      game.make_bet(1000)
      expect(game.bet).to eq 1000
    end
  end
end
