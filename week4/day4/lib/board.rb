require_relative 'board_case.rb'
class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :board, :is_won

  def initialize
    empty = BoardCase.empty
    @board = [empty,empty,empty,empty,empty,empty,empty,empty,empty]
    @is_won = false
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def move(index,token)
    @board[index] = token
  end

  def position_taken?(index)
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
    input = gets.chomp.strip.to_i-1
    while !(0..8).to_a.include?(input)
      puts "Accept only the number 1-9, please try again:"
      input = gets.chomp.strip.to_i-1
    end
    if !valid_move?(input)
      puts "This position has already taken, pleade take another one."
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

      val1 = @board[windex_1]
      val2 = @board[windex_2]
      val3 = @board[windex_3]

      if (val1 == val2 && val2 == val3 && val1.strip != "")
        @is_won = true
        return val1
      end
    end
    @is_won = false
    return false
  end

  def full?
    @board.all?{|token| token.strip != ""}
  end

  # Defined a tied game
  def draw?
    won?
    return (!@is_won && full?)
  end

  def over?
    won?
    return (draw? || @is_won)
  end

end
