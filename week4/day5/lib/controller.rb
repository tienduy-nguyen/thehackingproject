require_relative 'gossip.rb'
class Controller
  attr_reader :gossip
  def create_gossip
    @gossip = Gossip.new("author","This is a example content")
    @gossip.save
  end
end