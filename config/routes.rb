Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  get '/home/index'
 
  get '/agenda/index'
  
  post '/events/:id', to: 'events#validate'

  resources :comments, only: [:index, :create, :new, :show]
  resources :events
  resources :admin, only: [:index]


  namespace :admin do
    resources :users, :comments, :events, :admin
    
  end
end
