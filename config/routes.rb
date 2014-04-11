Hello::Application.routes.draw do
  root to: 'products#index'

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :admins
  resources :products
  resources :product_uploads
end
