class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string   :name
      t.text     :address
      t.string   :phone
      t.string   :country
      t.string   :city

      t.timestamps null: false
    end
  end
end
