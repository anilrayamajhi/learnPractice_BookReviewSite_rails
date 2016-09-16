class BooksController < ApplicationController
  def index
    @books = Book.all.order("created_at DESC")
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      redirect_to new_book_path
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :description, :author)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
