Rails.application.routes.draw do
  resources :calls
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
