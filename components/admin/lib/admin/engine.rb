module Admin
  class Engine < ::Rails::Engine
    isolate_namespace Admin

    initializer engine_name do |app|
      app.config.assets.precompile += %w(active_admin.js active_admin.css active_admin/print.css)

      ActiveAdmin.setup do |config|
        config.load_paths += [File.join(__dir__, 'admin')]
        config.localize_format = :short

        config.namespace :admin do |c|
          c.site_title = "Admin"
          c.root_to = "tables#index"
          c.authentication_method = false
          c.current_user_method = false
          c.logout_link_path = proc { Admin::Engine.routes.url_helpers.logout_path }
          c.logout_link_method = :get
          c.comments = false
        end
      end
    end
  end
end
