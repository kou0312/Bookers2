class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def show
    @booker = Book.new
    @user = current_user
    @book = User.find(params[:id])
    @books = @book.books
  end

  def index
    @user = current_user
    @users = User.all
    @booker = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    @users = current_user
    redirect_to user_path(@users) unless @user == current_user
  end

end
