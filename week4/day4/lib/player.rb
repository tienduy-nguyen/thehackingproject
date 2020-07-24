class Player
  attr_reader :name,:token
  
  def initialize(name, token="X")
    @name = name
    @token = token
  end
end
