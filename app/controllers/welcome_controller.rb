class WelcomeController < ApplicationController
  include ListOfCategories

  before_action :list, only: [:index]

  def index
    @products = Product.all

  end
end
