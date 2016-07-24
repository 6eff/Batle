class Player
  INIT_HP = 100
  ATTACK_HP = Kernel.rand(1..10)
  attr_reader :name, :hp

  def initialize(name)
    @name = name
    @hp = INIT_HP
  end

  def receive_damage
    @hp -= ATTACK_HP
  end

end
