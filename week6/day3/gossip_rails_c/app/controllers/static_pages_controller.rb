class StaticPagesController < ApplicationController
  def team
  end

  def contact
  end

  def home
    @first_name = params[:first_name] 
    @gossips = Gossip.all.order(updated_at: :desc)
    # @tags = @gossip.gossip_tags
    # p @tags
  end
end
