class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
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
    #no need to pass book, coz book is is being passed to edit and update via before_action
  end

  def update
    if @book.update(book_params)  #if book is updated successfully: updating the book meens changing the book params so passing the book_params
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.delete
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :description, :author)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
