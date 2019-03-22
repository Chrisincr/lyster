Rails.application.routes.draw do
  root 'application#index'
  resources :points
  resources :matches
  resources :rounds
  resources :combatants
  resources :tournemants
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
