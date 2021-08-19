require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web, at: "/sidekiq"
end
