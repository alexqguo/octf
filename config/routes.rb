AthleteLookup::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :athletes, only: [:new, :create, :show, :index] do
    resources :marks, only: [:new, :create]
  end
  
  root to: "sessions#new"
end