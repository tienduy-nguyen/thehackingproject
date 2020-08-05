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

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create 
    @user = User.new()
  end

  # GET /users/:id/edit
  def edit

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
      @user = User.find(params[:id])
    end


end
