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

  permit_params :title, :description, :image, :price, :quantity, :manufacturer,
                :weight, :height, :width, :length, :year, :status, :category_id, :delete_asset

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
    column :title
    column :category
    column :price
    column :quantity
    column :manufacturer
    column :year
    column :status
    actions
  end

  show do |ad|
    attributes_table do
      row :title
      row :category
      row :description
      row :image do
        image_tag(ad.image.url(:thumb))
      end
      row :price
      row :quantity
      row :manufacturer
      row :weight
      row :height
      row :width
      row :length
      row :year
      row :status
    end
  end

  form do |f|
    f.inputs "Товары" do
      f.input :title
      f.input :category
      f.input :description
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
      f.input :delete_asset, as: :boolean, required: false, label: "Удалить изображение?"
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
