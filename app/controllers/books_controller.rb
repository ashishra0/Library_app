class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :show, :destroy]

  def index
    @book = Book.paginate(page: params[:page], per_page: 10 )
  end

  def new
    @book = Book.new
    @categories = Category.all.map {|c| [ c.name, c.id ] }
    @authors = Author.all.map { |a| [ a.name, a.id ] }
  end

  def create
    @book = Book.new(book_params)
    @book.author_id = params[:author_id]
    params[:books][:category_ids].each do |category_id|
      unless category_id.empty?
        category = Category.find(category_id)
        @books.categories << Category
      end
    end
    if @book.save
      flash[:notice] = "Book was succesfully added"
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map { |c| [ c.name, c.id ] }
    @authors = Author.all.map { |a| [a.name, a.id ] }
  end

  def update
    @book.author_id = params[:author_id]
    params[:books][:category_ids].each do |category_id|
      unless category_id.empty?
        category = Category.find(category_id)
        @book.categories << category
      end
    end
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
    params.require(:book).permit(:title, category_ids: [])
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
