AthleteLookup::Application.routes.draw do
  resource :session 
  resources :athletes
  
  root to: "sessions#new"
end