require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

# ---------------------------------------------
# Program
puts "----------------------------------------"
puts "|Welcome to 'THEY WANT ALL MY OOP     !|"
puts "|The goals is to be the last survivor !|"
puts "----------------------------------------"

puts "What is your name?"
print ">"
name_player = gets.chomp
my_game = Game.new(name_player)
puts "Hi #{name_player}, welcome!"
puts "Press any key to start game and enjoy the game ......"
gets.chomp

my_game.new_players_in_sight

# Loop attack round
while my_game.is_still_ongoing?
  
  # Prepare for the battle
  puts " "
  puts "--------------------------------------"
  puts "The new round to attack"
  my_game.new_players_in_sight
  my_game.human_player.show_state
  my_game.menu_choice
  if my_game.is_still_ongoing?
    my_game.enemies_attack
  end
  
end
my_game.end_game

binding.pry