Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items do
    resources :purchase_histories, only: [:index, :create]
  end
end
