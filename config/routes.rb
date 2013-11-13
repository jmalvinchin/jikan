Jikan::Application.routes.draw do

  resources :items

  resources :entries

  root to: "dashboard#index"

  get "dashboard/index"
  
end