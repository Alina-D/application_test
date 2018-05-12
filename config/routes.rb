Rails.application.routes.draw do

  devise_for :users, :controllers => {
      :sign_in => 'users/registrations'
  }

  resources :payments

  get 'payments/index'
  root to: 'payments#index'
end
