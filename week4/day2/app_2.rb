require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

# ---------------------------------------------
# Methods helpers
def call_enemies(array)
  list_enemies = []
  array.each do |enem|
    list_enemies.push(Player.new(enem))
  end
  return list_enemies
end


def is_all_died?(enemies)
  return enemies.all?{|e| e.life_points <= 0}
end

def show_state_list(enemies)
  enemies.each_with_index do |e,i|
    if e.life_points >0 
      puts "#{i} - #{e.name} has #{e.life_points} life points"
    end
  end
end
def attack_enemies(player,enemies)
  enemies.each do |e|
    if e.life_points > 0
      player.attacks(e)
    end
  end
end

def enemies_attack(player, enemies)
  enemies.each do |e|
    if player.life_points > 0 && e.life_points >0
        e.attacks(player)
    end
  end
end



# ---------------------------------------------
# Program
puts "----------------------------------------"
puts "|Welcome to 'THEY WANT ALL MY OOP     !|"
puts "|The goals is to be the last survivor !|"
puts "----------------------------------------"

puts "What is your name?"
print ">"
name_player = gets.chomp
player1 = HumanPlayer.new(name_player)
puts "Hi #{name_player}, welcome!"
puts "Press any key to start game and enjoy the game ......"
gets.chomp

bots  = call_enemies(["Josiane","José"])



# Loop attack round
while player1.life_points >0 && !is_all_died?(bots)
  
  # Prepare for the battle
  puts " "
  puts "--------------------------------------"
  puts "The new round to attack"
  player1.show_state
  puts ""
  puts "Which action do you want to take?"
  puts "a - Search the better weapon"
  puts "s - Search a health pack"
    
  puts " "
  puts "Attack a player in view "
  show_state_list(bots)

  choice = gets.chomp
  case choice
  when "a"
    player1.search_weapon
  when "s"
    player1.search_health_pack
  when "0".."1" 
    bot  = bots[choice.to_i]
    if bot.life_points > 0
      player1.attacks(bot)
    else
      puts "#{bot.name} has been died, you can not attack him anymore!"
    end
  else
    puts "You need to choice only a or s, please try it again"
    choice = gets.chomp
  end
  gets.chomp

  puts " "
  puts "The bots attack you!"
  if  !is_all_died?(bots)
    enemies_attack(player1, bots)
  end
end

puts " "
puts "*"*50
puts player1.life_points > 0 ? 
"Bravo! You win the battle!" : 
"Lose! Game Over :("
puts "*"*50

# binding.pry

