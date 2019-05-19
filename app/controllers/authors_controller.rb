class AuthorsController < ApplicationController
  before_action :set_author, only: [:edit, :update, :show, :destroy]

  def index
    @author = Author.paginate(page: params[:page], per_page: 3 )
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "author #{@author.name} was added"
      redirect_to author_path(@author)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      flash[:notice] = "Author #{@author.name} was succesfully updated"
      redirect_to author_path(@author)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @author.destroy
    flash[:notice] = "Author was deleted"
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end

  def set_author
    @author = Author.find(params[:id])
  end

end