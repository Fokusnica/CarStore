ActiveAdmin.register OrderStatus do

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
  menu parent: "Статусы Заказов"
  permit_params :title, :description


  index do
    selectable_column
    id_column
    column :title
    actions
  end

  show do
    attributes_table :title, :description
  end

  form do |f|
    f.inputs "Стату Заказа" do
      f.input :title
      f.input  :description

    end
    f.actions
  end

end
