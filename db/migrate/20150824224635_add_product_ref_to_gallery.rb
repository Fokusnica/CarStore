class AddProductRefToGallery < ActiveRecord::Migration
  def change
    add_reference :galleries, :product, index: true, foreign_key: true
  end
end
