class CategoriesController < ApplicationController
  def index
    @category = Category.paginate(page: params[:page], per_page: 3 )
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was added"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
  end
end