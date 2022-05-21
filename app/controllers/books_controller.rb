class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to new_book
  end
  def index
    @user = User.all
  end
  def show
    @book = Book.find(params[:id])
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path
  end


  private

  def book_params
    params.require(:book).permit(:body, :title)
  end


end
