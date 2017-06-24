Rails.application.routes.draw do

  root 'dashboard#frontdoor'
  get '/dashboard', to: 'dashboard#home'
  get '/admin_panel', to: 'dashboard#admin_panel'

  resources :seasons
  resources :events do
    resources :forecasts
  end

  devise_for :users

end
