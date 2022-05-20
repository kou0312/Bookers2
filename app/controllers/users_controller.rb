class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.book.page(params[:page])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
