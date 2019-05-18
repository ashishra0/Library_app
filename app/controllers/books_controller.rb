class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :show, :destroy]

  def index
    @book = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was succesfully added"
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "Book #{@book.title} was succesfully updated"
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "Book was deleted"
    redirect_to books_path
  end

  def show
  end

  private
  
  def book_params
    params.require(:book).permit(:title)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
