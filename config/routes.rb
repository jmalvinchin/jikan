Jikan::Application.routes.draw do

  resources :items

  resources :entries do
    resources :addons
  end

  root to: "dashboard#index"

  get "dashboard/index"
  
end