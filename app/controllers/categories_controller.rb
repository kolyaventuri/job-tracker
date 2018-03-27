# Category Controller
class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to category_path(category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      flash[:success] = "#{category.name} was successfully deleted!"
    else
      flash[:failure] = "There was an error deleting the category #{category.name}"
    end

    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
