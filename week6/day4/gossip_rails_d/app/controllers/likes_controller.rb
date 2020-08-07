class LikesController < ApplicationController
  include GossipsHelper
  include SessionsHelper

  before_action :find_gossip

  def create
    if already_liked?(@gossip)
      Like.where(user_id: current_user.id, gossip_id: @gossip.id).destroy_all
    else
      @gossip.likes.create(user_id: current_user.id)
    end
    redirect_to(request.env['HTTP_REFERER'])
  end

  private
  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end


end
