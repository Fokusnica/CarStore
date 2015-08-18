class Product < ActiveRecord::Base
  before_destroy :product_not_have_line_items
  belongs_to :category
  has_many :products_providers, dependent: :destroy
  has_many :providers, through: :products_providers
  has_many :line_items


  def product_not_have_line_items
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Существуют товарные позиции')
      return false
    end
  end

end
