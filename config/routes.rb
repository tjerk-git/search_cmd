Rails.application.routes.draw do
  get 'canvas/index'
  get 'canvas/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#index"

  get 'sessions/:sgid', to: 'sessions#magic_link', as: 'email_login'
  get 'sessions/:sgid/confirm', to: 'sessions#confirm', as: 'email_confirm_login'

  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'login', to: 'sessions#login', as: 'login'

  post 'login', to: 'sessions#new'
  post 'canvas', to: 'canvas#create'
  patch 'canvas/show/:slug', to: 'canvas#update'
  get  'canvas', to: 'canvas#index'

  get 'user/edit', to: 'users#edit', as: 'edit_user'
  delete 'user/delete', to: 'users#destroy', as: 'delete_user'

  get 'canvas/show/:slug', to: 'canvas#show', param: :slug, as: 'canvas_show'

  get 'canvas/old', to: 'canvas#old'
  get 'canvas/list', to: 'canvas#list'

  resources :users, param: :slug do
    collection do
      post :search
    end
  end
end
