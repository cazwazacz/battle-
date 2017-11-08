require 'game'

describe Game do

  let(:player1) { double(:player1, deduct_hp: true, hp: 90) }
  let(:player2) { double(:player2, deduct_hp: true, hp: 90) }
  subject(:game) { described_class.new(player1, player2) }

  context "Creating new game instances" do
    it "accepts first player instance" do
      expect(game.player1).to eq player1
    end
    it "accepts second player instance" do
      expect(game.player2).to eq player2
    end
    it 'Has a turn' do
      expect(game.turn).to eq 1
    end
  end

  context "When attacking" do
    it "reduces player 2's hp by 10" do
      game.attack
      expect(player2.hp).to eq 90
    end

    it "reduces player 1's hp by 10" do
      game.attack
      game.attack
      expect(player1.hp).to eq 90
    end

    it 'Changes the turn' do
      game.attack
      expect(game.turn).to eq 2
    end

    it 'Changes the turn when 2 attacks' do
      game.attack
      game.attack
      expect(game.turn).to eq 1
    end

  end

end
