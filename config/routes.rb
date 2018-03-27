Rails.application.routes.draw do

  devise_for :users

  resources :payments

  get 'payments/index'
  root to: 'payments#index'
end
