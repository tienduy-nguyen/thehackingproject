class GossipsController < ApplicationController
  include SessionsHelper
  include GossipsHelper

  before_action :logged_in_user
  
  # GET /gossips
  def index
    @gossips = all_gossips
  end

  # GET /gossips/:id
  def show
    @gossip = Gossip.find_by(:id => params[:id])
  end

  # GET /gossips/new
  def new
    @gossip = Gossip.new
    @tags = Tag.all
  end

  # POST /gossips
  def create 
    @gossip = Gossip.new(gossip_params)
    @gossip.user = current_user
    if @gossip.save
      flash[:success] = "Create Gossip Success!"
      @tag = Tag.find(params[:tag])
      GossipTag.create(tag: @tag, gossip: @gossip)
      redirect_to gossips_path
    else
      @gossip.errors.full_messages.each do |message|
        flash[:error] = message
      end
      render :new
    end
  end


  # GET /gossips/:id/edit
  def edit
    @gossip = Gossip.find(params[:id])
    @tags = Tag.all
    # Check user
    if @gossip.user.id != current_user.id
      flash[:error] = "Permission denied!"
      redirect_back_or @gossip
    end
  end

  # PUT /gossips/:id/edit
  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      flash[:success] = "Update Gossip Success!"
      redirect_to gossips_path
    else
      @gossip.errors.full_messages.each do |message|
      flash[:error] = message
      end
      render :edit
    end

   
  end

  # DELETE /uses/:id
  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.user.id != current_user.id
      flash[:error] = "Permission denied!"
      redirect_to gossips_path
    else
      @gossip.destroy
      redirect_to gossips_path
    end
  end

  private
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end
    def gossip_filter
      @gossip = Gossip.find_by(:id => params[:id]) or not_found
    end

end
