class CategoryController < ApplicationController
  def index
    @categories = Category.all
    @products =  Product.order(:title).page(params[:page]).per(15)
  end
end
