class ProfileController < ApplicationController
  def profile
    @user = User.find_by(:first_name => params[:first_name])
  end
end
