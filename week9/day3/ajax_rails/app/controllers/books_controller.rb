class BooksController < ApplicationController
  def index
    @books  =Book.all
  end
  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    # redirect_back(fallback_location: root_path)

    respond_to do |format|
      format.html { redirect_to books_path }
      format.js { }
    end
  end

  private

  def book_params
    params.permit(:title, :author)
  end
end
