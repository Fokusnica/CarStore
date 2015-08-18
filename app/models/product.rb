class Product < ActiveRecord::Base
  belongs_to :category
  has_many :products_providers, dependent: :destroy
  has_many :providers, through: :products_providers
end
