class Player
  #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
  attr_reader :name,:token
  
  def initialize(name, token="X")
    #TO DO : doit régler son nom et sa valeur
    @name = name
    @token = token
  end
end
