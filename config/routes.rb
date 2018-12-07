Rails.application.routes.draw do
  resources :calls do 
     resources :proposals
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
