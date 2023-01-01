Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root "pages#index"

  resources :leagues, only: [:show, :new, :create] do
    scope module: :leagues do
      resources :memberships, only: [:index, :new, :create, :destroy]
      post "memberships/:id/activate", to: "memberships#activate", as: "membership_activate"
      put "memberships/:id/pending", to: "memberships#pending", as: "membership_pending"
      put "memberships/:id/reject", to: "memberships#reject", as: "membership_reject"

      resources :seasons, only: [:create]

      get "/season/confirmation", as: "seasons_confirmation", to: "seasons#confirmation"
      post "/season/confirm", as: "seasons_confirm", to: "seasons#confirm"
    end
  end

  resources :seasons, only: [:show] do
    scope module: :seasons do
      resources :games, only: [:show, :new, :create]
    end
  end

  resources :memberships, only: [:index]
  put "membership/:id/approve", to: "memberships#approve", as: "membership_approve"
  delete "membership/:id/archive", to: "memberships#archive", as: "membership_archive"
  delete "membership/:id/reject", to: "memberships#reject", as: "membership_reject"

  get "sign-up", to: "users#new", as: "sign_up"
  post "users", to: "users#create", as: "users"
  get "sign-in", to: "sessions#new", as: "sign_in"
  post "sign-in", to: "sessions#create"
  delete "sign-out", to: "sessions#destroy"

  get "dashboard", to: "users#show", as: "dashboard"
end
