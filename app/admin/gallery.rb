ActiveAdmin.register Gallery do

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
  menu parent: "Галлерея"
  permit_params :product_id, :photo

  index do
    selectable_column
    id_column

    column :product
    column "Изображения" do |m|
      image_tag(m.photo.url(:thumb), size: "50x50")
    end
    actions
  end

  show do |ad|
    attributes_table do
      row :product
      row :photo do
        image_tag(ad.photo.url(:thumb))
      end
    end
  end


  form do |f|
    f.inputs "Добавление фото" do
      f.input :product
      f.input :photo, :as => :file
    end
    f.actions
  end

end
