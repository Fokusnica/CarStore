ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    #   Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Последние зарегистрированные клиенты" do

          table_for User.order("created_at desc").limit(5) do
            column :name
            column :email
          end
          strong { link_to "Просмотр всех клиентов", admin_users_path }

        end
      end

      column do
        panel "Последние добавленные модели" do

          table_for Product.order("created_at desc").limit(10) do
            column :title
            column :price
            column :status
          end
          strong { link_to "Просмотреть все модели", admin_products_path }

        end
      end
    end

    columns do

      column do
        panel "Последние добавленные поставщики" do

          table_for Provider.order("created_at desc").limit(10) do
            column :name
            column :phone

          end
          strong { link_to "Просмотреть всех поставщиков", admin_providers_path }
        end
      end
    end
  end # content
end
