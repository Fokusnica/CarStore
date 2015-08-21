class ProductController < ApplicationController
  def index
  end

  def show

    @product = Product.find(params[:id])
    @products = Product.all

  end
end
