Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:new, :create, :show]
  resources :attractions
  get '/signin', to: 'users#signin'
  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'

  post '/rides', to: 'rides#rides'
end
