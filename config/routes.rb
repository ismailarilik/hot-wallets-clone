# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transactions
  resources :wallets
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'wallets#index'
end
