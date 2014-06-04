AthleteLookup::Application.routes.draw do
  
  get "records", action: "records", controller: "assets"
  get "home", action: "home", controller: "assets"
  get "admin", action: "admin", controller: "assets"
  post "send_email", action: "send_email", controller: "assets"
  resource :session, only: [:create, :destroy]
  
  resources :records, only: [:edit, :update]
  resources :athletes, except: :destroy do
    resources :marks, only: [:new, :create, :index, :update, :create, :destroy]
    get "graph_data", action: "graph_data"
  end
  get "demo", action: "demo", controller: "athletes"
  get "update_all", action: "update_all", controller: "athletes"

  root to: "assets#home"
end