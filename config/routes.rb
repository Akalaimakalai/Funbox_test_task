require 'sidekiq/web'

Rails.application.routes.draw do
  root 'exchange_rates#index'

  resources :exchange_rates, only: %i[ index ]
  resources :dummies, only: %i[ create ]
  get '/admin', to: 'dummies#new'

  mount Sidekiq::Web => '/sidekiq'
end
