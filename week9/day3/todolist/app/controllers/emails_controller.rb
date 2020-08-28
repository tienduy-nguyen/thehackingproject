class EmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  def index
    @emails = Email.all.order(created_at: :desc)
  end

  def show
    puts "------------------------"
    puts params
    @email.update(read: true) if !@email.read
    # render json: @email.to_json
    respond_to do |format|
      format.html{}
      format.js{}
      format.json{}
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

    if params[:invertRead]
      @email.update(read: false)
      puts "click un read"
      respond_to do |format|
        format.html{}
        format.js{}
      end
    else
      respond_to do |format|
        if @email.update(email_params)
          format.html{redirect_to @email}
          format.json{render :show, status: :ok, location: @email}
          format.js{}
          flash[:success] = "Email was succesfully updated!"

        else
          format.html{render :edit}
          format.json{render json: @email.errors, status: :unprocessable_entity}
          format.js{}
        end
      end

    end
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
