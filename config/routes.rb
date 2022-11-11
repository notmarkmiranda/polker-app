Rails.application.routes.draw do
  # root "articles#index"
  get "sign-up", to: "users#new", as: "sign_up"
  post "users", to: "users#create", as: "users"
  get "dashboard", to: "users#show", as: "dashboard"
end
