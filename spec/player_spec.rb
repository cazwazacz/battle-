require 'player'

describe Player do

  let(:player1) {Player.new("Bob")}
  let(:player2) {Player.new("Tom")}

  context "When having a new player" do
    it "should have a name" do
      expect(player1.name).to eq "Bob"
    end

      it "should have a 100HP" do
        expect(player1.hp).to eq 100
      end
  end

  context "When Bob attacks Tom, Tom's hp reduces by 10" do
    it "attack should reduce opponent's hp by 10" do
      player1.attack(player2)
      expect(player2.hp).to eq 90
    end

    it "deducts hp by 10" do
      player1.deduct_hp
      expect(player1.hp).to eq 90
    end
  end

end
