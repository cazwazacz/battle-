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
  end

  context "When player 1 attacks player 2" do
    it "reduces player 2's hp by 10" do
      game.attack(player2)
      expect(player2.hp).to eq 90
    end
  end

end