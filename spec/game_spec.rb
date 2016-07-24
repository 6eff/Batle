require "game"

describe Game do
  subject(:game) { described_class.new(player1, player2) }
  subject(:finished_game) { described_class.new(loser, player2) }
  let(:player1) {double :player1, hp: Player::INIT_HP}
  let(:player2) {double :player2, hp: Player::INIT_HP}
  let(:loser) {double :loser, hp: 0}

  describe "#atack" do
    it "damages chosen player" do
      expect(player1).to receive :receive_damage
      subject.attack(player1)
    end
  end

  describe "players" do
    it 'has player1' do
      expect(game.player1).to eq player1
    end

    it 'has player2' do
      expect(game.player2).to eq player2
    end
  end

  describe "#switch" do
    it "swithces turns" do
      expect{game.switch}.to change {game.player1}.to player2
    end
  end

  describe "#game_over?" do
    it "game is over when player1 reaches 0HP" do
      expect(loser).to receive :receive_damage
      finished_game.attack(loser)
      expect(finished_game).to be_game_over
    end
  end
end
