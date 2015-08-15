Rails.application.routes.draw do

  get 'profile' =>  'profiles#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get '/pages/about' => 'pages#about'
  root 'pages#index'

  resources :locations, only: [:create, :destroy]

  resource :search, only: [:show]
  resources :artists, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

end
