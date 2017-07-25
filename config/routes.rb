Rails.application.routes.draw do
  devise_for :creators
  resources :users
  root 'users#index'
end
