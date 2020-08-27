class EmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  def index
    @emails = Email.all
  end

  def show
    @email.update(read: true) if !@email.read

    respond_to do |format|
      format.html{}
      format.js{}
    end
  end

  def new
    create
  end

  def edit

  end

  def create
    @email = Email.new(body: Faker::Lorem.paragraph, object: Faker::Book.title)

    respond_to do |format|
      if @email.save
        format.html { redirect_to @email }
        format.json { render :show, status: :created, location: @email }
        format.js {}
        flash[:success] = 'Email was successfully created.'
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
        format.js {}
        flash[:error] = 'Somthing go wrong!'
      end
    end
  end

  def update

  end

  def destroy
    @email.destroy
    respond_to do |format|
      format.html{
        redirect_to emails_path
      }
      format.json { head :no_content }
      format.js{}
      flash[:success] = "Email was successfully destroyed!"
    end

  end

  private
  def set_email
    @email = Email.find(params[:id])
  end

  def email_params
    params.permit(:body, :text)
  end
end
