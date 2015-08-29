ActiveAdmin.register Order do

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

  menu parent: "Заказы"
  permit_params :price, :updated_at, :user_id, :order_status_id, :address_id


  index do
    selectable_column
    id_column
    column :user
    column :price
    column :order_status
    actions
  end

  show do
    attributes_table :user, :price, :order_status, :address
  end

end
