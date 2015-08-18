class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string   :title
      t.text     :description
      t.string   :img
      t.float    :price
      t.integer  :quantity
      t.string   :manufacturer
      t.float    :weight
      t.float    :height
      t.float    :width
      t.float    :length
      t.integer  :year
      t.boolean  :status

      t.timestamps null: false
    end
  end
end
