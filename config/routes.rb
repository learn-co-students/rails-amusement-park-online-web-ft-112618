Rails.application.routes.draw do
  
  root "welcome#index"

  resources :users, only: [:new, :create, :show]
  
  resources :attractions

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/rides', to: 'rides#create'
end
