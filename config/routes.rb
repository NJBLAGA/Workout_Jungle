Rails.application.routes.draw do
  #Root Path
  root 'jungle#index'
  
  #Devise Generated routes for users, assigned to custom controller "registrations"
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  #Devise Generated routes for admins
  devise_for :admins, controllers: {
    admins: 'admins'
  }

  #Custom generated routes for admins
  #Admin dashboard/index page
  get "admins", to: "admins#index", as: 'admins_index'
  #Admin destroy function
  delete "admins/:id", to: "admins#destroy", as: 'admins_destroy'
  #Admin assign admin function
  put "admins/:id", to: "admins#assign", as: 'assign_admin'
  
  #Scaffold generated routes for listings
  resources :listings
  #Custom generated route for "my listing page"
  get 'listings#own', to: 'listings#own', as: 'own_listing'

  #Nested routes for inbox feature
  resources :conversations do
    resources :messages
  end
  #Scaffold generated routes for line_items
  resources :line_items
  #Scaffold generated routes for carts
  resources :carts
 
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
