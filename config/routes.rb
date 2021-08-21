Rails.application.routes.draw do
  resources :save_moneys
  root to: "home#index"
  devise_for :users

  resources :payments
  resources :receivables
end
