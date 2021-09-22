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

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
