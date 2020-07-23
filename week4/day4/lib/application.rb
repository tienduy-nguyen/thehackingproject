require_relative 'game.rb'

class Application
  def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    game = Game.new
    game.play
    # loop_turn(game)
  end

  def loop_turn(game)
    while !game.is_end_game?
      game.turn
    end
    game.announced_end_game
    puts "Do you want to restart the next round (Y/N)?"
    choice = gets.chomp.upcase.strip
    if choice == "Y"
      game.newround
      loop_turn(game)
    else
      game.end_game
    end
  end

end
