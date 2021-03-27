Rails.application.routes.draw do
  root "home#index"
  get "/a-propos", to: "home#about", as: "about"
  get "/inscription", to: "registration#register", as: "register"
  post "/inscription", to: "registration#create"
  delete "/deconnexion", to: "session#destroy", as: "logout"
  get "/connexion", to: "session#login", as: "login"
  post "/connexion", to: "session#create"

  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
