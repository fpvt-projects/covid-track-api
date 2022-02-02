Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/latest-news', to: 'news#index'
  get '/covid-data', to: 'covid#index'
end
