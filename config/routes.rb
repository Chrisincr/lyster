Rails.application.routes.draw do
  get 'sessions/new'
  root 'application#index'
 
  resources :users
  resources :tournaments,shallow: true do
    resources :combatants
    resources :rounds do
      resources :matches do
        resources :points
      end
    end
  end
  

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'



  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
