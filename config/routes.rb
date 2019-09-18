Rails.application.routes.draw do

  root 'pages#index'

  get 'home', :to => 'pages#home'
  get 'profile', :to => 'pages#profile'

  get 'login', :to => 'sessions#new'
  post 'login', :to => 'sessions#create'
  delete 'logout', :to => 'sessions#destroy'

  resources :generals

end
