class UsersController < ApplicationController
  before_action :user_filter, only: [:show, :edit, :update, :destroy]
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
    @user = User.new
    @city_id = City.all.sample.id
  end

  # POST /users
  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:sucess] = "Create User Sucessfull!"
      redirect_to users_path
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
    @city_id = City.all.sample.id
  end

  # PUT /users/:id/edit
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Update User succesfull!"
      redirect_to users_path
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

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :age, :email, :description, :city)
    end
    def user_filter
      @user = User.find_by(:id => params[:id]) or not_found
    end
end
