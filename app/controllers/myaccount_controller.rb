class MyaccountController < ApplicationController
  include ListOfCategories

  before_action :list, only: [:index]

  def index
  end
end
