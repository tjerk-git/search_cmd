Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "canvas#index"
  get 'canvas/index'
  get 'canvas/create'
  post 'canvas', to: 'canvas#create'
  patch 'canvas/show/:slug', to: 'canvas#update'
  get  'canvas', to: 'canvas#index'
  get 'canvas/show/:slug', to: 'canvas#show', param: :slug, as: 'canvas_show'
  get 'canvas/old', to: 'canvas#old'
  get 'canvas/list', to: 'canvas#list'
end
