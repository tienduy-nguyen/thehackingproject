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
    @email = Email.new
  end

  def edit

  end

  def create

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
