Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get 'pages/index'
  get 'pages/new'
  get '/create', to: 'pages#new'
  post '/create',  to: 'pages#create'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/profile'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
  resources :pages
end
