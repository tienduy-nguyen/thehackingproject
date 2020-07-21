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


class HumanPlayer < Player
  attr_accessor :weapon_level
  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end
  def show_state
    puts "Player #{@name} has #{@life_points} life points and a weapon level #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    key = rand(1..6)
    puts "You found a weapon level #{key}"
    if @weapon_level < key
      puts "Youhou! It is better than your current weapon: you take it"
      @weapon_level = key
    else
      puts "M@*#$ ... it is not better than your current weapon ..."
    end
  end

  def search_health_pack
    key = rand(1..6)
    case key
    when (2..5)
      puts "Bravo, you found a health pack of +50 life points"
      @life_points +=50
    when 6
      puts "Waow, you found a health pack of +80 life points"
      @life_points +=80
    else
      puts "You found nothing ..."
    end
  end
end