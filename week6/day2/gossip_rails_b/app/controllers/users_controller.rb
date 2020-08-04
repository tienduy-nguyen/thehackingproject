class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
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

  end

  # GET /users/new
  def new
    @gossip = Gossip.new
  end

  # POST /users
  def create 
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


end
