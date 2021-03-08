Rails.application.routes.draw do
  resources :listings
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'jungle#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
