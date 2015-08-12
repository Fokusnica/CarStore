ActiveAdmin.register Category do

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
  permit_params :name, :description


  index do
    selectable_column
    id_column
    column :name
    column :description

    actions
  end


  show do
    attributes_table :name, :description
  end


  form do |f|
    f.inputs "Categories" do
      f.input :name
      f.input :description
    end
    f.actions
  end



end
