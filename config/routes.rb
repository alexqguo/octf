AthleteLookup::Application.routes.draw do
  
  get "records", action: "records", controller: "assets"
  get "about", action: "about", controller: "assets"
  resource :session, only: [:new, :create, :destroy]
  
  resources :athletes, except: :destroy do
    resources :marks, only: [:new, :create]
  end
  
  get "a" => "records"
  
  root to: "sessions#new"
end