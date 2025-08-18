class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
    @book = @user.profile_image
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_show_path  
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
