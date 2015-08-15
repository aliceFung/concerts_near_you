Rails.application.routes.draw do

  get 'profile' =>  'profiles#index'
  devise_for :users
  get '/pages/about' => 'pages#about'
  root 'pages#index'

  resources :searches, only: [:index]

  resources :locations, only: [:create, :destroy]

end
