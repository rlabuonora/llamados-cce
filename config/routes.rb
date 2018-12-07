Rails.application.routes.draw do
  resources :proposals
  resources :calls
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
