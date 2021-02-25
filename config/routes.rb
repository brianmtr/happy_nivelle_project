Rails.application.routes.draw do
  get 'about/index'
  resources :userevents
  root 'home#index'
  devise_for :users

  # get '/home/index'
 
  get '/agenda/index'
  post '/users/:id', to: 'role#role'
  post '/events/:id', to: 'validate#validate'
  # post '/comments/:id', to: 'comments#accepted'
  resources :comments
  resources :events do
    member do
      put "participates" => "participates#update"
      put "maybes" => "maybes#update"
      put "notparticipates" => "notparticipates#update"
    end
  end


resources :participates, only: [ :update ]

  namespace :admin do
    resources :users, :comments, :events do
      member do
        put "role" => "role#update"
      end
    end
  end

  resources "contacts", only: [:new, :create]
  
end
