AthleteLookup::Application.routes.draw do
  
  resources :records, only: :index
  resource :session, only: [:new, :create, :destroy]
  
  resources :athletes, except: :destroy do
    resources :marks, only: [:new, :create]
  end
  
  root to: "sessions#new"
end