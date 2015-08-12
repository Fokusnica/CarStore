class Provider < ActiveRecord::Base
  has_many :products_providers, dependent: :destroy
  has_many :products, through: :products_providers
end
