Rails.application.routes.draw do
  root "pages#index"

  resources :leagues, only: [:show, :new, :create] do
    scope module: :leagues do
      resources :memberships, only: [:index, :new, :create, :destroy]
      post "memberships/:id/activate", to: "memberships#activate", as: "membership_activate"
    end
  end

  get "sign-up", to: "users#new", as: "sign_up"
  post "users", to: "users#create", as: "users"
  get "sign-in", to: "sessions#new", as: "sign_in"
  post "sign-in", to: "sessions#create"
  delete "sign-out", to: "sessions#destroy"
  get "dashboard", to: "users#show", as: "dashboard"
end
