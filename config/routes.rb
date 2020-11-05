Rails.application.routes.draw do
  resources :picks
  resources :joins
  resources :leagues
  resources :users
  resources :teams
  resources :matches
  post '/login', to: "auth#create"
  get '/reauth' , to: 'auth#reauth'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
