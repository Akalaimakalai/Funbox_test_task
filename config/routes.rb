Rails.application.routes.draw do
  root 'exchange_rates#index'

  resources :exchange_rates, only: %i[ index ]
end
