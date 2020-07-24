class BoardCase
  attr_accessor :first
  attr_reader :second

  def initialize
  end

  # Get the token of first player given by the input when start game
  def self.first
    @first
  end

  # Set the token of first player
  def self.first=first_value
    @first = first_value
  end

  # Get auto the token of second player
  def self.second
    return (@first == "X") ? "O" : "X"
  end

  # Empty value
  def self.empty
    return " "
  end

end
