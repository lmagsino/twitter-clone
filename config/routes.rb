Rails.application.routes.draw do

  root 'pages#index'

  get 'home', :to => 'pages#home'

  resources :users, :only => [:new, :create]

  get 'login', :to => 'sessions#new'
  post 'login', :to => 'sessions#create'
  delete 'logout', :to => 'sessions#destroy'

end
