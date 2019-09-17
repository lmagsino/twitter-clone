Rails.application.routes.draw do

  root 'pages#index'

  get 'home', :to => 'pages#home'
  get 'profile', :to => 'pages#profile'

  resources :users, :only => [:new, :create]

  get 'login', :to => 'sessions#new'
  post 'login', :to => 'sessions#create'
  delete 'logout', :to => 'sessions#destroy'

  post 'generals', :to => 'generals#create'

end
