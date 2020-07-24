# Game Tic Tac Toe

## Installation

This app is using Ruby version 2.7.1

To install project, follow the simple steps:

1. You can see, this page is not in direct repository. It is at **thehackingproject/week4/day4**, you need to return the base of repository **thehackingproject**
2. Then, copy the link https of this reposiotory and use `git clone` to clone the project on your computer
3. In the folder **thehackingproject** clone, go to directly in the folder **week4/day4** and open your terminal on this folder. Or you can use the command `cd` to go to in that folder: `cd week4/day4`
4. If you use the Ruby version 2.5.1 on your machine, you need to change in the Gemfile to take that version
   
  My Gemfile with the ruby version: 2.7.1
  ```ruby
  #Gem file
  source "https://rubygems.org"

  git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

  ruby '2.7.1'
  gem 'rspec'
  gem 'pry'
  ```

  Gemfile to change with the Ruby version 2.5.1
  ```ruby
  #Gem file
  source "https://rubygems.org"

  git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

  ruby '2.5.1'
  gem 'rspec'
  gem 'pry'
  ```
5. Use command `bundle install` to install all the gem dependencies.
6. To launch the program, tap `ruby app.rb`
   

## Introduction game Tic Tac Toe

What's the [Game Tic-Tac-Toe](https://en.wikipedia.org/wiki/Tic-tac-toe) ?

Somes rules of games:

1. There are only two players
2. Give the names of players when start game
3. The board has only 9 empty squares. Each designate by its vertical position (A,B, or C) follow by its horizontal position (1,2 or 3). The top-right case name A3, the bottom-right name C3
4. At the begin, the program will show the empty board of game and ask players who want to take the first turn. Player 1 places their token (X) in only 1 square in their choice. 2nd turn, player 2 places their token (0) and they can't touche the square that Player 1 already fills. The cycle contines until a player wins or there's a tie game.
5. At the end of game, the program will propos a new game.

## Analysis

- There are 8 winnind cominations: Top row, Middle row, Bottom row, Left column, Middle column, Right column, Left diagonal, and Right diagonal
- There's a draw/tie when the entire board is filled with X's and O's but not winning combinations can be found.
- We start the game at 0 until we fill up the 9 squares or until someone wins or there’s a tie.
- If there’s a winner, we have to call on the winner(board) method and put out a message.
- The program must be have 6 class: Game, Player, Board, BoardCase, Application, Show

### Class Game

- Intilialize data
- Change the turn of players
- Announce end game or still continue

### Class Player

- Attribue: name, color
- Methods: player_input (get input of player and convert to index), position_taken? (check if user given a valid position)

### Class Board

- Attribute: player
- Winning Combination: 8 cases
- Tied case: 1 case
- Methods: display_board, move(to update board), valid_move?, current_player, turn_count(to define current player), show_board_win, check_board_full?, won?, check_draw?( if not won), over? (check if the game is tied or there's winner), winner(Annouce winner)

### Class BoardCase

- 9 squares/cases in this class

### Class Application

- Start game
- Loop turns

### Class Show

- Display a view of board game on terminal (not very necessary)


## TODO

- Interesting functionality allows us to play with an computer