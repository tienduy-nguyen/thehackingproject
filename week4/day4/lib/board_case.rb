class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
  attr_accessor :first
  attr_reader :second

  def initialize
  end

  def self.first
    @first
  end

  def self.first=first_value
    @first = first_value
  end

  def self.second
    return (@first == "X") ? "O" : "X"
  end
  def self.empty
    return ""
  end

end
