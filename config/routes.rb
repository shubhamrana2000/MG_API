Rails.application.routes.draw do
  resources :userprofiles
  resources :fantasies
  resources :tasks
  resources :games
  resources :rewards
  resources :points_histories
  resources :withdrawl_histories
  resources :accounts
  resources :app_opens
  resources :users
  resources :players
  resources :teams
  resources :matches
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  mount Cricket::Base => '/'
  root to: "matches#index"

end
