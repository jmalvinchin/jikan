Jikan::Application.routes.draw do

  resources :items

  resources :entries do
    resources :addons
  end

  resources :configurations

  root to: "dashboard#index"

  get "dashboard/index"
  
end