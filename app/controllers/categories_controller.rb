class CategoriesController < ApplicationController
  before_action :fetch_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    #binding.pry # odpala pry w momencie wywołania metody
    #raise params.to_yaml # wyrzuca wyjątek do przeglądarki
    return unless nasty_hacker
    @category = Category.new(category_params)
    @category.valid? ? create_post : handle_post_validation_failed
  end

  def show; end

  def edit; end

  def update
    @category.update_attributes(category_params)
    redirect_to @category
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category #{@category.name} deleted"
    redirect_to categories_path
  end

  private

  def nasty_hacker
    post_params[:user_id] == current_user.id.to_s
  end

  def handle_post_validation_failed
    flash[:errors] = @category.errors.full_messages
    redirect_back(fallback_location: root_path)
  end

  def create_post
    @category.save
    flash[:notice] = 'Category created!'
    redirect_to @category
  end

  def fetch_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
