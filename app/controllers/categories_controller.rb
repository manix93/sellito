class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    #binding.pry # odpala pry w momencie wywołania metody
    #raise params.to_yaml # wyrzuca wyjątek do przeglądarki
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category created!'
      redirect_to @category
      # odpowiednik
      #redirect_to category_path(@category)
    else
      flash[:alert] = 'Could not create category'
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
