AthleteLookup::Application.routes.draw do
  resource :session 
  resources :athletes do
    resources :marks, only: [:new, :create]
  end
  
  root to: "sessions#new"
end