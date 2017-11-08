require 'player'

describe Player do

  let(:player1) {Player.new("Bob")}
  context "When having a new player" do
    it "should have a name" do
      expect(player1.name).to eq "Bob"
    end

      it "should have a 100HP" do
        expect(player1.hp).to eq 100
      end
  end

end
