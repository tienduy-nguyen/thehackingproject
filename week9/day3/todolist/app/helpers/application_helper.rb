module ApplicationHelper
  def date_without_time(time)
    return time.strftime("%Y-%m-%d")
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
end
