class Game
  attr_reader :player1, :player2

  def initialize(player1, player2, finished_game = false)
    @player1 = player1
    @player2 = player2
    @finished_game = false
  end

  def attack player
    player.receive_damage
  end

  def switch
    role = @player1
    @player1 = @player2
    @player2 = role
  end

  def game_over?
    @player1.hp == 0 || @player2.hp == 0
  end

end
