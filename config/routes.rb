Rails.application.routes.draw do

  root 'dashboard#frontdoor'
  get '/dashboard', to: 'dashboard#home'
  get '/admin_panel', to: 'dashboard#admin_panel'

  resources :seasons
  resources :events do
    get   'forecasts/actual/edit', to: 'forecasts#edit_actual'
    patch  'forecasts/actual', to: 'forecasts#update_actual'
    resources :forecasts
  end

  devise_for :users

end
