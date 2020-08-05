class GossipsController < ApplicationController
  before_action :gossip_filter, only: [:show, :edit, :update, :destroy]
  # GET /gossips
  def index
    @gossip = Gossip.all
  end

  # GET /gossips/:id
  def show
    @gossip = Gossip.find_by(:id => params[:id])
  end

  # GET /gossips/new
  def new
    @gossip = Gossip.new
  end

  # POST /gossips
  def create 
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
      flash[:success] = "Create Gossip Success!"
      redirect_to root_path
    else
      @gossip.errors.full_messages.each do |message|
        flash[:error] = message
      end
      render :new
    end
  end

  # GET /gossips/:id/edit
  def edit

  end

  # PUT /gossips/:id/edit
  def update

  end

  # DELETE /uses/:id
  def destroy

  end

  private
    def gossip_params
      params.require(:gossip).permit(:title, :content, :user_id)
    end
    def gossip_filter
      @gossip = Gossip.find(params[:id])
    end

end
