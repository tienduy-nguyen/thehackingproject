require_relative './player.rb'

class  Game
  attr_accessor :human_player,:players_left, :enemies_in_sight

  def initialize(name_player)
    @human_player = HumanPlayer.new(name_player)
    @players_left = 10
    @enemies_in_sight = []
  end

  def get_random_enemie
    name = "Player"+(1..4).map{rand(1..9)}.join
    return Player.new(name)
  end

  def new_players_in_sight
    if @enemies_in_sight.size > @players_left
      return puts "All the players are already in sight"
    end
    key = rand(1..6)
    case key
    when (2..4)
      new_enemie =  get_random_enemie()
      @enemies_in_sight.push(new_enemie)
      puts "One new enemie #{new_enemie.name} has just arrived"
    when 5,6
      new_enemie1 =  get_random_enemie()
      new_enemie2 =  get_random_enemie()
      @enemies_in_sight.push(new_enemie1)
      @enemies_in_sight.push(new_enemie2)
      puts "Two new enemies #{new_enemie1.name} & #{new_enemie2.name} have just arrived"
    else
      puts "Do not have the new enemie arrive"
    end
  end


  def kill_player(player)
    @enemies_in_sight.delete(player)
  end

  def is_still_ongoing?
    return @human_player.life_points > 0 && @enemies_in_sight.any?{|x| x.life_points > 0}
  end


  def show_players
    @human_player.show_state
    puts "There are #{@enemies_in_sight.size} bots left to beat"
  end

  def menu
    @enemies_in_sight.each_with_index do |e,i|
      if e.life_points >0 
        puts "#{i} - #{e.name} has #{e.life_points} life points"
      end
    end
  end


  def menu_choice
    puts " "
    puts "Which action do you want to take?"
    puts "a - Search the better weapon"
    puts "s - Search a health pack"

    puts " "
    puts "Attack a player in view "
    menu()

    print ">"
    choice = gets.chomp
    case choice
    when "a"
        @human_player.search_weapon
        @human_player.show_state
    when "s"
      @human_player.search_health_pack
      @human_player.show_state
    when ("0"..@enemies_in_sight.size.to_s)
      bot = @enemies_in_sight[choice.to_i]
      @human_player.attacks(bot)
      if bot.life_points <= 0
        kill_player(bot)
      end
      
    else
      puts "You need to choice only a, s or number, please try it again"
      choice = gets.chomp
    end
  end


  def enemies_attack
    puts " "
    puts "The bots attack you!"
    @enemies_in_sight.each do |e|
      if @human_player.life_points > 0 && e.life_points >0
          e.attacks(@human_player)
      end
    end
  end 

  def end_game
    puts ""
    puts "*"*50
    puts @human_player.life_points > 0 ? 
    "Bravo! You win the battle!" : 
    "Lose! Game Over :("
    puts "*"*50
  end

end