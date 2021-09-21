class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def create
    book = Book.new(list_params)
    book.save
    redirect_to '/top'
  end

  def show
  end

  def edit
  end

  private

  def list_params
    params.require(:book).permit(:title, :body)
  end
end
