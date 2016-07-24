require 'player'

describe Player do
  let(:player1){described_class.new("Player1_name")}
  let(:player2){described_class.new("Player2_name")}
  subject { described_class.new(name) }
  it "returns it's name" do
    expect(player1.name).to eq "Player1_name"
  end

  describe "hit points" do
    it "shows hit points" do
      expect(player1.hp).to eq described_class::INIT_HP
    end
  end

  describe "doing damage" do
    it "deals damage to the player" do
      expect{ player2.receive_damage }.to change{ player2.hp }.by -described_class::ATTACK_HP
    end
  end
end
