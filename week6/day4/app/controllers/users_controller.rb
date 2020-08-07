class UsersController < ApplicationController
  include SessionsHelper

  before_action :logged_in_user, only: [:show]
  # GET /users
  def index
    @users = User.all.order(updated_at: :desc)
  end

  # GET /users/:id
  def show
    @user = User.find_by(:id => params[:id])
  end

  # GET /users/:first_name
  def show_by_first_name
    @user = User.find_by(:first_name => params[:first_name])
  end

  # GET /users/new
  def new
    @user = current_user
    if !@user.nil? 
      redirect_to gossips_path
    else
      @user = User.new
    end
  end

  # POST /users
  def create 
    @user = User.new(email: user_params[:email], 
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation])
    if @user.save
      flash[:success] = "Create account succesffuly!"
      log_in @user
      redirect_back_or @user
    else
      @user.errors.full_messages.each do |message|
        flash[:error] = message
      end
      render :new
    end
  end

  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:error] = "Permission denided!"
      return redirect_to users_path
    end
    @cities = City.all
  end

  # PUT /users/:id/edit
  def update_profile
    @user = current_user
    @user.city_id = user_params[:city_id]
    @user.username = user_params[:username]
    @user.first_name = user_params[:first_name]
    @user.last_name = user_params[:last_name]
    @user.age = user_params[:age]
    @user.description = user_params[:description]
    if @user.save
      flash[:success] = "Update user profile succesfully!"
      redirect_back_or @user
    else
      @user.errors.full_messages.each do |message|
        flash[:error] = message
      end
      render :edit
    end
  end


  # DELETE /uses/:id
  def destroy

  end

  # GET /users/:id/settings
  def settings

  end

  # PUT /users/:id/settings
  def update_settings

  end

  private
    def user_params
      params.require(:user).permit(
      :username,
      :first_name, 
      :last_name, 
      :age, 
      :description, 
      :city_id,
      :email,
      :password,
      :password_confirmation
      )
    end
end
