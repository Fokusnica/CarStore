class AddBelongsToCategory < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.belongs_to :category
    end
  end
end
