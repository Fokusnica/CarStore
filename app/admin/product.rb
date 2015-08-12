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

  menu parent: "Каталог"

  permit_params :title, :description, :img, :price, :quantity, :manufacturer,
                :weight, :height, :width, :length, :year, :status, :category_id

  scope :all, :default => true

  scope :available do |products|
    products.where("status = 'true'")
  end
  scope :not_avialable do |products|
    products.where("status = 'false'")
  end


  index do
    selectable_column
    id_column
    column "Название", :title
    column "Категория", :category
    column "Цена", :price
    column "Кол-во", :quantity
    column "Производитель", :manufacturer
    column "Год", :year
    column "Наличие", :status
    actions
  end

  show do
    attributes_table :title, :category, :description, :img, :price, :quantity, :manufacturer,
                     :weight, :height, :width, :length, :year, :status
  end

  form do |f|
    f.inputs "Users" do
      f.input :title
      f.input :category
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
