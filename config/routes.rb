Rails.application.routes.draw do

  # get 'profiles' =>  'profiles#show'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get '/pages/about' => 'pages#about'
  root 'pages#index'
  get 'search' => 'pages#show'

  resources :profiles, only: [:show, :update]
  resources :locations, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

  # resources :artists, only: [:create, :destroy]

end
