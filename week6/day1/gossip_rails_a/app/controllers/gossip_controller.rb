class GossipController < ApplicationController
  def gossip
    id = params[:id]
    @gossip = Gossip.find_by(:id => id)
  end
end
