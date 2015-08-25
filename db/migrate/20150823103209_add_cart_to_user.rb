class AddCartToUser < ActiveRecord::Migration
  def change
    add_reference :users, :cart, index: true, foreign_key: true
  end
end
