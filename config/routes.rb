Rails.application.routes.draw do
  devise_for :users
  get '/pages/about' => 'pages#about'
  root 'pages#index'

  resources :locations

end
