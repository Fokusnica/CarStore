class AddGroupUserToUser < ActiveRecord::Migration
  def change
    add_reference :users, :group_user, index: true, foreign_key: true
  end
end
