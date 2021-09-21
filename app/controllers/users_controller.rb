class UsersController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end
end
