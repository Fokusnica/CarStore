ActiveAdmin.register Provider do

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
  menu parent: "Каталог"

  permit_params :name, :phone, :address, :description, :comment


  index do
    selectable_column
    id_column
    column :name
    column :phone
    column :email

    actions
  end


  show do
    attributes_table :name, :phone, :address, :description, :comment
  end


  form do |f|
    f.inputs "Users" do
      f.input :name
      f.input :phone
      f.input :address
      f.input :description
      f.input :comment
    end
    f.actions
  end


end
