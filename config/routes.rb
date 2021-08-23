Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :payments
  resources :receivables
  resources :save_moneys do
    resources :save_money_wallets
  end
end
