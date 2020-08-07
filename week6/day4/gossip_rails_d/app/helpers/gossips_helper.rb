module GossipsHelper
  include SessionsHelper
  def all_gossips
    return Gossip.all.order(updated_at: :desc)
  end
  def already_liked?(gossip)
    Like.where(user_id: current_user.id, gossip_id: gossip.id).exists?
  end
  def find_like(gossip)
    Like.where(user_id: current_user.id, gossip_id: gossip.id).first
  end
  def user_liked_class(gossip)
    already_liked?(gossip) ? "user-liked" : ""
  end
end
