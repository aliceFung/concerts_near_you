Rails.application.routes.draw do
  get '/pages/about' => 'pages#about'
  root 'pages#index'

end
