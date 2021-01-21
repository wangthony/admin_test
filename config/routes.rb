Rails.application.routes.draw do
  mount Admin::Engine => '/admin'

  ActiveAdmin.routes(self)
end
