class BooksController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @user = current_user
    
    #過去１週間のいいねの数が多い順に本の投稿を表示させる
    @books = Book.left_joins(:week_favorites).group(:id).order(Arel.sql('count(book_id) desc'))
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "successfully"
    else
     #@new = Book.new
      @books = Book.all
      @user = current_user
      render :index
    end
  end


  def show
    @new = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @comment = BookComment.new

  end

  def edit
    @book = Book.find(params[:id])
    #if @book.user == current_user
      #render :edit
    #else
      #redirect_to books_path
    #end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "successfully"
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :rate)
  end

  def correct_user
    book = Book.find(params[:id])
    redirect_to books_path unless book.user == current_user
  end

end
