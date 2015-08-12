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


  permit_params :email, :password, :password_confirmation, :name


  index do
    selectable_column
    id_column
    column :name
    column :email
    actions
  end


  show do
    attributes_table :name, :email
  end


  form do |f|
    f.inputs "Users" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end



end
