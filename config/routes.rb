AthleteLookup::Application.routes.draw do
  
  get "demo", action: "demo", controller: "athletes"
  get "records", action: "records", controller: "assets"
  get "home", action: "home", controller: "assets"
  get "admin", action: "admin", controller: "assets"
  resource :session, only: [:new, :create, :destroy]
  
  resources :athletes, except: :destroy do
    resources :marks, only: [:new, :create, :index, :update, :create]
    get "graph_data", action: "graph_data"
  end
  
  get "a" => "records"
  
  root to: "sessions#new"
end