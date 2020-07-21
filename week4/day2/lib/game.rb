class Player
  attr_accessor :name, :life_points
  def initialize(name)
    @name = name
    @life_points = 10
  end

  # Show life point of player
  def show_state
    puts "#{@name} has #{@life_points} life points"
  end

  # Subtract the life_points by a given point
  def gets_damage(point)
    @life_points -= point
    if @life_points <= 0
      puts "Player #{@name} has been died!"
    end
  end

  # Attack a player
  def attacks(player)
    puts "Player #{@name} attacks player #{player.name}"
    damage = compute_damage
    player.gets_damage(damage)
    puts "It inflicted #{damage} points of damage on him"
  end

  def compute_damage
    return rand(1..6)
  end
end