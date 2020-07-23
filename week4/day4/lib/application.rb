require_relative 'game.rb'

class Application
  def perform
    game = Game.new
    game.play
    loop_turn(game)
  end

  def loop_turn(game)
    while !game.is_end_game?
      game.turn
    end
    game.winner
    puts "Do you want to restart for the new round (Y/N)?"
    choice = gets.chomp.upcase.strip
    if choice == "Y"
      game.new_round
      loop_turn(game)
    else
      game.end_game
    end
  end

end
