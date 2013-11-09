Jikan::Application.routes.draw do

  resources :users, :items

  root to: "dashboard#index"

  get "dashboard/index"
  
end