Rails.application.routes.draw do
  resources :tles
  resources :satellites
  resources :constellations
  resources :watchlists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
