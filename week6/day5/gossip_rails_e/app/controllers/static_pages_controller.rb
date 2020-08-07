class StaticPagesController < ApplicationController
  include SessionsHelper

  def team
  end

  def contact
  end

  def home
    @first_name = params[:first_name] 
    @gossips = Gossip.all.order(updated_at: :desc)
    @lastest_gossips = @gossips.take(16)
  end

end
