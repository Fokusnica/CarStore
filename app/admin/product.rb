ActiveAdmin.register Product do

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


  permit_params :title, :description, :img, :price, :quantity, :manufacturer,
                :weight, :height, :width, :length, :year, :status


  index do
    selectable_column
    id_column
    column :title
    column :price
    column :quantity
    column :manufacturer
    column :year
    column :status
    actions
  end


  show do
    attributes_table :title, :description, :img, :price, :quantity, :manufacturer,
                     :weight, :height, :width, :length, :year, :status
  end


  form do |f|
    f.inputs "Users" do
      f.input :title
      f.input :description
      f.input :img
      f.input :price
      f.input :quantity
      f.input :manufacturer
      f.input :weight
      f.input :height
      f.input :width
      f.input :length
      f.input :year
      f.input :status
    end
    f.actions
  end


end
