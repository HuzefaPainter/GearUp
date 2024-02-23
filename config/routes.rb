Rails.application.routes.draw do
  resources :locations
  devise_for :users
  root to: "home#index"
  post 'home/index'
end
