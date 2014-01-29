AthleteLookup::Application.routes.draw do
  resource :session 
  resources :athletes
  
  # root to: "static#index"
  root to: "sessions#new"
end