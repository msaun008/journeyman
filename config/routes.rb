Rails.application.routes.draw do

  root 'dashboard#frontdoor'
  get '/dashboard', to: 'dashboard#home'
  get '/admin_panel', to: 'dashboard#admin_panel'

  resources :seasons
  resources :events do
    get   'forecasts/observed/edit', to: 'forecasts#edit_observed'
    patch  'forecasts/observed', to: 'forecasts#update_observed'
    resources :forecasts
  end

  devise_for :users

end
