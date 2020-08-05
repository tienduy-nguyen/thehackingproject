class GossipsController < ApplicationController
  before_action :gossip_filter, only: [:show, :edit, :update, :destroy]
  # GET /gossips
  def index
    @gossips = Gossip.all.order(updated_at: :desc)
  end

  # GET /gossips/:id
  def show
    @gossip = Gossip.find_by(:id => params[:id])
  end

  # GET /gossips/new
  def new
    @gossip = Gossip.new
    @user_id  = User.all.sample.id
  end

  # POST /gossips
  def create 
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
      flash[:success] = "Create Gossip Success!"
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
    @user_id = User.all.sample.id
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
    @gossip.destroy
    redirect_to gossips_path
  end

  private
    def gossip_params
      params.require(:gossip).permit(:title, :content, :user_id)
    end
    def gossip_filter
      @gossip = Gossip.find_by(:id => params[:id]) or not_found
    end

end
