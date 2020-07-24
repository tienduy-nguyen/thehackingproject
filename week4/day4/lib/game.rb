require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'board_case.rb'

class Game
  attr_accessor :current_player,:status,:board, :player1, :player2
  def initialize
    @status= "On going"
  end

  # Call it when we start game
  def play
    init_player()
    init_board()
    puts "Test game play"
  end

  # Initialize two players for game
  def init_player
    puts "|************************|"
    puts "|   TIC TAC TOE GAME     |"
    puts "|************************|"

    # Input game
    puts ""
    puts "To start game, you need enter name of two player: "
    print ">Name player 1: "
    name1 = gets.chomp.strip
    print ">His token (X or O): "
    token1= gets.chomp.strip.upcase

    while token1 != "X" && token1 != "O"
      puts "Token must be X or O, please try again."
      print ">Token's player 1 (enter X or O): "
      token1= gets.chomp.strip.upcase
    end

    print ">Name player 2: "
    name2 = gets.chomp.strip
    token2 = token1 == "X" ? "O": "X"
    puts "Game started: #{name1}(#{token1}) vs #{name2}(#{token2}) "
    @player1 = Player.new(name1,token1)
    BoardCase.first = token1
    @player2 = Player.new(name2, token2)
    @current_player = @player1
  end

  # Initialize board game, empty when restart
  def init_board
    @board = Board.new
    @board.display_board
  end

  # Return curren_player
  def get_current_player
    @board.count_turn % 2 == 0 ? (@current_player = @player1) : (@current_player  = @player2)
  end

  # Change the turn of each player
  def turn
    puts "Turn #{@board.count_turn + 1}, player #{get_current_player.name} choose:"
    @board.play_turn
  end

  # Restart game, but not restart player
  def new_round
    init_board()
  end  

  # Get winner or tied game, give an annoucement on the console
  def winner
    if @board.over?
      check = @board.won?
        if check != false
          player = player1.token == check ? player1 : player2
          puts
          puts "|***************************************************************|"
          puts "Congratualations #{player.name}! You have won this match."
          puts "|***************************************************************|"
          puts "Press anykey to continue ..."
          gets.chomp
        else
          puts "End game. There's no winner. This is tied game :("
        end
     end
  end

  # Check if the game is end
  def is_end_game?
    @status= "End"
    return @board.over?
  end

  # Use this method when user don't want to take the new round
  def end_game
    puts "Thank to play my game. See you again."
  end
end
