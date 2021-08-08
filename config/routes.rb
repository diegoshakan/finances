Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :payments
  resources :receivables
end
