Rails.application.routes.draw do
  root "home#index"
  get "/a-propos", to: "home#about", as: "about"
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
