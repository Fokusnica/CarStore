class Product < ActiveRecord::Base
  before_destroy :product_not_have_line_items
  belongs_to :category
  has_many :products_providers, dependent: :destroy
  has_many :providers, through: :products_providers
  has_many :line_items
  has_many :galleries, dependent: :nullify
  include Paperclip::Glue
  has_attached_file :image, :styles => { :medium => "255x237>", :thumb => "100x100>" }, :default_url => "missing.png"
  validates_attachment :image, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }

  attr_accessor :delete_asset
  before_validation { image.clear if delete_asset == '1' }


  def product_not_have_line_items
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Существуют товарные позиции')
      return false
    end
  end
  def self.search(search)
    where("lower (title) LIKE ?", "%#{search.downcase}%")
    where("lower (description) LIKE ?", "%#{search.downcase}%")
  end

end
