class GroupUser < ActiveRecord::Base

  has_many :users, dependent: :nullify

end
