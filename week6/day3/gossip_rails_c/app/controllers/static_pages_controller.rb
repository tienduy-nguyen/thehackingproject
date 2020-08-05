class StaticPagesController < ApplicationController
  def team
  end

  def contact
  end

  def home
    @first_name = params[:first_name] 
    @gossips = Gossip.all.order(updated_at: :desc)
    @lastest_gossips = @gossips.take(16)
    @lastest_1 = @lastest_gossips[0..3]
    @lastest_2 = @lastest_gossips[4..7]
    @lastest_3= @lastest_gossips[8..11]
    @lastest_4 = @lastest_gossips[12..15]

    
  
  end

end
