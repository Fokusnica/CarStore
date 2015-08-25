class CategoryController < ApplicationController
  def index

    @products =  Product.order(:title).page(params[:page]).per(15)

  end

  def show

    @category = Category.find(params[:id])
    @products = @category.products.order(:title).page(params[:page]).per(6)
  end

end
