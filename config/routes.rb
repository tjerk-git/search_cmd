Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  get 'sessions/:sgid', to: 'sessions#magic_link', as: 'email_login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'login', to: 'sessions#login', as: 'login'
  
  post 'login', to: 'sessions#new'

  get 'user/edit', to: 'users#edit', as: 'edit_user'
  delete 'user/delete', to: 'users#destroy', as: 'delete_user'

  resources :users, param: :slug do
    collection do
      post :search
    end
  end
end
