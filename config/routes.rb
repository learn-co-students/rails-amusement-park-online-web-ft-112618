Rails.application.routes.draw do
  root 'home#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to:'sessions#destroy'
  resources :attractions
  resources :users
end
