Rails.application.routes.draw do

  root 'pages#index'

  get 'home', :to => 'pages#home'
  get 'profile', :to => 'pages#profile'
  get 'conversation/:id', :to => 'pages#conversation', :as => 'conversation'

  get 'login', :to => 'sessions#new'
  post 'login', :to => 'sessions#create'
  delete 'logout', :to => 'sessions#destroy'

  resources :replies, :only => [:create, :update]
  resources :tweets, :only => [:create, :update, :destroy]
  resources :users, :only => [:new, :create]

end
