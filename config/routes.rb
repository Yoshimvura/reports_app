# frozen_string_literal: true

Rails.application.routes.draw do
  get "oauth_test/index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: %i[show index]

  resources :books do
    resources :comments
  end

  resources :reports do
    resources :comments
  end

  root to: "oauth#index"

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: %i[create destroy]
end
