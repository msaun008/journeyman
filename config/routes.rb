Rails.application.routes.draw do
  root 'dashboard#home'

  resources :seasons
  resources :events do
    resources :forecasts
  end

  devise_for :users

  # TODO Remove this eventually
  resources :forecasts
end
