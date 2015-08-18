class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
