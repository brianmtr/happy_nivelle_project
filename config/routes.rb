Rails.application.routes.draw do
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
      put "participate" => "events#participate"
      put "maybe_participate" => "events#maybe_participate"
      put "not_participate" => "events#not_participate"
    end
  end


  namespace :admin do
    resources :users, :comments, :events
  end
end
