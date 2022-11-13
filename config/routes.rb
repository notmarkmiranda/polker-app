Rails.application.routes.draw do
  root "pages#index"

  get "sign-up", to: "users#new", as: "sign_up"
  post "users", to: "users#create", as: "users"
  get "sign-in", to: "sessions#new", as: "sign_in"
  post "sign-in", to: "sessions#create"
  delete "sign-out", to: "sessions#destroy"
  get "dashboard", to: "users#show", as: "dashboard"
end
