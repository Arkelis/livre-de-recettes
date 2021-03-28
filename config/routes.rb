Rails.application.routes.draw do
  root "home#index"
  get "/a-propos", to: "home#about", as: "about"

  get "/inscription", to: "registration#register", as: "register"
  post "/inscription", to: "registration#create"

  get "/compte", to: "accounts#edit", as: "account"
  patch "/compte", to: "accounts#update"

  get "/compte/recuperation", to: "recovery#recover", as: "account_recovery"
  post "/compte/recuperation", to: "recovery#send_recover_token"

  get "/compte/reinitialisation", to: "recovery#reset", as: "password_reset"
  post "/compte/reinitialisation", to: "recovery#update_password"

  delete "/deconnexion", to: "session#destroy", as: "logout"
  get "/connexion", to: "session#login", as: "login"
  post "/connexion", to: "session#create"

  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
