ActiveAdmin.register Table, as: "Table", namespace: :admin do
  actions(:index, :show, :new, :create, :edit, :update, :destroy)
  menu(priority: 1)

  controller do
    include Rails.application.routes.url_helpers # override engine routes
  end

  index do
    column "ID", sortable: :id do |obj|
      obj.id
    end
    column "Name", sortable: nil do |obj|
      obj.name
    end
    actions
  end

  config.sort_order = "id_asc"

  config.filters = false

  show do
    attributes_table do
      row "ID" do |obj|
        obj.id
      end
      row "Created At" do |obj|
        obj.created_at
      end
      row "Updated At" do |obj|
        obj.updated_at
      end
      row "Name" do |obj|
        obj.name
      end
    end
  end

  permit_params(:name)

  form do |f|
    f.inputs do
      f.input(:name, as: :content, content: f.object.name, label: "Name")
    end

    f.actions
  end
end
