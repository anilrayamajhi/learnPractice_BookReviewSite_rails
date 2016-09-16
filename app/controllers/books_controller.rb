class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :destroy]
  #before_action will run first and only render things inside find_book private method with find, edit and destroy action; this help to code dry by not repeting code over and over again by simply pointing the actions

  def index
    @books = Book.all.order("created_at DESC")
  end

  def show
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

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :description, :author)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
