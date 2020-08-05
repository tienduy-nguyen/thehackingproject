class UsersController < ApplicationController
  before_action :user_filter, only: [:show, :edit, :update, :destroy]
  # GET /users
  def index
    if params[:query].present?
      @query = params[:query]
      @users = User.where("name iLike '%#{params[:query]}%'")
    else
      @users = User.all
    end
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
    @user = User.new()
  end

  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
    @city_id = City.all.sample.id
  end

  # PUT /users/:id/edit
  def update

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
