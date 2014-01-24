AthleteLookup::Application.routes.draw do
  resource :session do
    # everything will go here to ensure that user is logged in to view anything
    member { resources :athletes }
  end
  
  root to: "static#index"
end