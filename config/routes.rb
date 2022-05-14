Rails.application.routes.draw do
  devise_for :users

  # devise_scope :user do
    # Redirests signing out users back to sign-in
    # get 'users', to: 'devise/sessions#new'
  # end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'suppliers#index'

  resources :suppliers
  resources :users, only: %i[index show edit update destroy]
  resources :qualities
end
