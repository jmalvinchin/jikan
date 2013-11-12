Jikan::Application.routes.draw do

  resources :items

  root to: "dashboard#index"

  get "dashboard/index"
  
end