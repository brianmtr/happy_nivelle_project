Rails.application.routes.draw do
  get 'legalnotice/index'
  get 'about/index'
  resources :userevents
  root 'home#index'
  devise_for :users
  resource :users

  # get '/home/index'
  get '/agenda/index'
  post '/users/:id', to: 'role#role'
  put '/events/:id', to: 'validate#update'

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
        put "cancel", to: 'cancel#update'
      end
    end
  end

  resources "contacts", only: [:new, :create]
  get '/contacts', to: redirect('/contacts/new')
  
end
