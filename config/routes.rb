require "sidekiq/web"

Rails.application.routes.draw do
  constraints AdminConstraint do
    mount Sidekiq::Web, at: "/sidekiq"
  end

  root "home#index"
  resources :users, only: %i[new create]
  resource :sessions, only: %i[new create]
  resources :password_resets, only: %i[new create show edit update]
end
