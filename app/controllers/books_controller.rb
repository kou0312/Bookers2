class BooksController < ApplicationController

    before_action :correct_user, only: [:edit, :update]

  def create
    @booker = Book.new(book_params)
    @booker.user_id = current_user.id
    if @booker.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@booker.id)
    else
      @books =Book.all
      @user = current_user
      render :index
    end
  end
  def index
    @booker = Book.new
    @books = Book.all
    @user = current_user
  end
  def show
    @booker = Book.new
    @user = current_user
    @book = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id

    if @book.update(book_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to book_path(@book.id)
    else
        render :edit
    end
  end


  private

  def book_params
    params.require(:book).permit(:body, :title)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
