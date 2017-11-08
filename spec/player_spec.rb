require 'player'

describe Player do

  let(:player1) {Player.new("Bob")}
  context "When having a new player" do
    it "should have a name" do
      expect(player1.name).to eq "Bob"
    end
  end
end
