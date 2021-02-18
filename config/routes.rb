Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  get '/home/index'
 
  get '/agenda/index'
  
  post '/events/:id', to: 'events#validate'
  post '/comments/:id', to: 'comments#accepted'
  resources :comments
  resources :events
  resources :admin, only: [:index]


  namespace :admin do
    resources :users, :comments, :events, :admin
    
  end
end
