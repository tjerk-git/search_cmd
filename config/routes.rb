Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "canvas#index"
  get 'canvas/index'
  get 'canvas/create', to: 'canvas#new'
  post 'canvas', to: 'canvas#create'
  patch 'canvas/show/:slug', to: 'canvas#update'
  get  'canvas', to: 'canvas#index'
  get 'canvas/show/:slug', to: 'canvas#show', param: :slug, as: 'canvas_show'
  get 'canvas/old', to: 'canvas#old'
  get 'canvas/list', to: 'canvas#list'
  get 'canvas/search', to: 'canvas#search'
  get 'canvas/search', to: 'canvas#query', as: 'query'
end
