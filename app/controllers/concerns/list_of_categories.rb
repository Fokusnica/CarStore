module ListOfCategories
  extend ActiveSupport::Concern
  def list
  @categories = Category.all
  end
end