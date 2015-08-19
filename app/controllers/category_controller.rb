class CategoryController < ApplicationController
  def index
    @categories = Category.all
    @products =  Product.order(:title).page(params[:page]).per(15)
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @product = @category.products.order(:title).page(params[:page]).per(3)
  end

end
