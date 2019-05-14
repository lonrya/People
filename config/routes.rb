Rails.application.routes.draw do
  root "people#index"
  get "/about", to: "people#about"
  
  resources :people 
end
