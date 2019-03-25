Rails.application.routes.draw do
  root 'application#index'
 
  resources :users
  resources :tournaments,shallow: true do
    resources :rounds do
      resources :matches do
        resources :points
      end
    end
  end
  

  get "tournaments/:tid/combatants" => "combatants#index", as: 'combatants'
  get "tournaments/:tid/combatants/new" => "combatants#new", as: 'new_combatant'
  post "tournaments/:tid/combatants" => "combatants#create"
  delete "tournaments/:tid/combatants/:cid" => "combatants#destroy"
  patch "tournaments/:tid/combatants/:cid" => "combatants#update"
  put "tournaments/:tid/combatants" => "combatants#update"
  get "tournaments/:tid/combatants/:cid" => "combatants#show", as: 'combatant'
  get "tournaments/:tid/combatants/:cid/edit" => "combatants#edit", as: 'edit_combatant'



  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
