AthleteLookup::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :athletes, except: :destroy do
    resources :marks, only: [:new, :create]
  end
  
  root to: "sessions#new"
end