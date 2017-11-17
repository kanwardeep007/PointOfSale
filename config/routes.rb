Rails.application.routes.draw do
  get 'search' => 'bills#search'
  resources :bills
  resources :items, only: [:new,:create,:patch]
  root to: 'homepage#index'
end
