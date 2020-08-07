class ApplicationController < ActionController::Base
  include SessionsHelper
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  def render_404
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:warning] = "Please log in"
      redirect_to login_url
    end
  end

end
