class Category < ActiveRecord::Base
  has_many :products, dependent: :nullify
  belongs_to :category
  has_many :children, :dependent => :destroy, :class_name => 'Category'
end
