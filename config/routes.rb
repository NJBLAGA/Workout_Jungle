Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_for :admins, controllers: {
    admins: 'admins'
  }
 
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'jungle#index'
  get "admins", to: "admins#index", as: 'admins_index'
  delete "admins/:id", to: "admins#destroy", as: 'admins_destroy'
  put "admins/:id", to: "admins#assign", as: 'assign_admin'
  
  
  resources :listings
  get 'listings#own', to: 'listings#own', as: 'own_listing'

  resources :conversations do
    resources :messages
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
