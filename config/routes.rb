Rails.application.routes.draw do

  namespace :v1 do
    resources :journals
    resources :users
    resources :sessions, only: [:create, :destroy]
    resources :registrations, only: [:create]
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/auth", to: "account_token#create"

  get '/latest-news', to: 'news#index'
  get '/covid-data', to: 'covid#index'
end
