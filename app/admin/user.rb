ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  menu parent: "Клиенты"
  permit_params :email, :password, :password_confirmation, :name, :phone, :group_user_id


  index do
    selectable_column
    id_column
    column :name
    column :group_user
    column :email
    column :phone
    actions
  end


  show do
    attributes_table :name, :email, :phone, :group_user
  end


  form do |f|
    f.inputs "Пользователи" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :phone
      f.input :group_user
    end
    f.actions
  end



end
