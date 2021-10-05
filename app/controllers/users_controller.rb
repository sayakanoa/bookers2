class UsersController < ApplicationController

before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id), notice: "successfully"
    else
    @books = Book.all
    @user = current_user
    render :index
    end
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following_user
    render 'show_following'
  end

  def follower
    @user = User.find(params[:id])
    @users = @user.follower_user
    render 'show_follower'
  end

  def edit
    @user = User.find(params[:id])
    #if @user == current_user
      #render :edit
    #else
      #redirect_to user_path(current_user.id)
    #end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "successfully"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    user = User.find(params[:id])
    redirect_to user_path(current_user) unless user == current_user
  end
end
