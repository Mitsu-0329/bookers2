class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    @user_show = User.find(params[:id])
  end

  def edit
    # ここから追加
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
    # ここまで追加
    @user = User.find(params[:id])
  end

  def update
    # ここから追加
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
    # ここまで追加
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end  
  
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
