class SearchController < ApplicationController
  def index
  end

  def show
    @products = Product.all
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC").page(params[:page]).per(6)
    else
      @products = Product.all.order('created_at DESC').page(params[:page]).per(6)
    end

  end
end
