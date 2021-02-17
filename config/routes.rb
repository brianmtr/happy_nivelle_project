Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  get '/home/index'
  
  resources :comments, only: [:index, :create, :new, :show]
  resources :events

  namespace :admin do
    resources :users, :comments, :events
  end
end
