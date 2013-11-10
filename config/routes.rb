Jikan::Application.routes.draw do

  devise_for :users

  resources :items

  root to: "dashboard#index"

  get "dashboard/index"
  
end