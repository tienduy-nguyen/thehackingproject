module ApplicationHelper
  include SessionsHelper

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end
  
  def flash_class(level)
    case level
        when "notice"
          return "alert alert-info"
        when "success"
          return "alert alert-success"
        when "error" 
          return "alert alert-danger"
        when "warning" 
          return "alert alert-warning"
        when "alert"
          return "alert alert-danger"
    end
  end

  def get_tags_by_gossipid(gossip_id)
    @tags =[]
    gossip_tags = GossipTag.where(gossip_id: gossip_id)
    if !gossip_tags.nil?
      begin
        gossip_tags.each do |go|
          if !@tags.include?(go.tag)
            @tags.push(go.tag)
          end
        end
      rescue => exception
        @tag.push(gossip_tags.tag)
      end
    end
    return @tags
  end

  def get_time(time_utc)
    return time_utc.strftime("%Y-%m-%d %k:%M:%S")
  end
  def get_time_verbose(time_utc)
    return time_utc.strftime("%B %d,%Y at %k:%M:%p")
  end

  def is_current_user?(user)
    if logged_in?  
      return current_user.id == user.id
    end
  end

end
