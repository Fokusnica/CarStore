class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float    :price

      t.timestamps null: false
    end
  end
end
