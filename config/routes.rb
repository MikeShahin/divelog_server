Rails.application.routes.draw do
  resources :dives
  resources :users 

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/get_current_user', to: 'sessions#get_current_user'
end
