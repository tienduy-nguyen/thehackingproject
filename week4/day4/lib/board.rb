require_relative 'board_case.rb'
class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :board

  def initialize
    empty = BoardCase.empty
    @board = [empty,empty,empty,empty,empty,empty,empty,empty,empty]
  end

  WIN_COMBINATIONS = [ 
    [0,1,2], # top_row 
    [3,4,5], # middle_row 
    [6,7,8], # bottom_row 
    [0,3,6], # left_column 
    [1,4,7], # center_column 
    [2,5,8], # right_column 
    [0,4,8], # left_diagonal 
    [6,4,2] # right_diagonal 
    ]

  def display_board
    puts
    puts "Board game: "
    puts "  #{@board[0]} |  #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts "  #{@board[3]} |  #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts "  #{@board[6]} |  #{@board[7]} | #{@board[8]} "

  end

  def move(index,token)
    @board[index] = token
  end

  def postion_taken?(index)
    return (@board[index].strip != "")
  end

  def valid_move?(index)
    return (index.between?(0,8) && !position_taken?(index))
  end

  def count_turn
    @board.count{|token| token.strip != ""}
  end

  def current_player_token
    count_turn % 2 == 0 ? BoardCase.first : BoardCase.second
  end

  def play_turn
    puts "Please enter 1-9"
    input = gets.chomp.strip.to_i
    while ![1..9].include?(input)
      puts "Accept only the number 1-9, please try again:"
      input = gets.chomp.strip.to_i
    end
    if !valid_move?(input)
      play_turn
    end
    move(input, current_player_token)
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |win_case|
      windex_1 = win_case[0]
      windex_2 = win_case[1]
      windex_3 = win_case[2]

      val_1 = @board[windex_1]
      val_2 = @board[windex_2]
      val_3 = @board[windex_3]

      if (val_1 == val_2 && val2 == val3 && val_1.strip != "")
        return val_1
      end
    end
    return false
  end

  def full?
    @board.all?{|token| token.strip != ""}
  end

  # Defined a tied game
  def draw?
    return (!won? && full?)
  end

  def over?
    return (draw? || won?)
  end

end
