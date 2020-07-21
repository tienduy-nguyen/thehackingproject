require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

player1 = Player.new("Josiane")
player2 = Player.new("José")

# Loop attack round
while player1.life_points >0 && player2.life_points >0
  puts "-"*50
  puts "Here is the status of each player: "
  player1.show_state
  player2.show_state
  puts " "
  puts "-"*50
  puts "Let's move on to the attack phase: "

  player1.attacks(player2)
  if  player2.life_points > 0
    player2.attacks(player1)
  end
end

puts " "
puts "*"*50
puts player1.life_points > 0 ? 
"Player #{player1.name} win the battle!" : 
"Player #{player2.name} win the battle!"
puts "*"*50

binding.pry


