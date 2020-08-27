module ApplicationHelper
  def date_without_time(time)
    return time.strftime("%Y-%m-%d")
  end
end
