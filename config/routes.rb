Rails.application.routes.draw do
  root 'application#index'
  #resources :points
  #resources :matches
  #resources :rounds
  #resources :combatants
  #resources :tournemants
  resources :users

  get "tournemants" => "tournemants#index", as: 'tournemants'
  get "tournemants/new" => "tournemants#new", as: 'new_tournemant'
  post "tournemants" => "tournemants#create"
  delete "tournemants/:tid" => "tournemants#destroy"
  patch "tournemants/:tid" => "tournemants#update"
  put "tournemants" => "tournemants#update"
  get "tournemants/:tid" => "tournemants#show", as: 'tournemant'
  get "tournemants/:tid/edit" => "tournemants#edit", as: 'edit_tournemant'

  get "combatants" => "combatants#index", as: 'combatants'
  get "combatants/new" => "combatants#new", as: 'new_combatant'
  post "combatants" => "combatants#create"
  delete "combatants/:cid" => "combatants#destroy"
  patch "combatants/:cid" => "combatants#update"
  put "combatants" => "combatants#update"
  get "combatants/:cid" => "combatants#show", as: 'combatant'
  get "combatants/:cid/edit" => "combatants#edit", as: 'edit_combatant'



  get "tournemants/:tid/rounds" => "rounds#index", as: 'rounds'
  get "tournemants/:tid/rounds/new" => "rounds#new", as: 'new_round'
  post "tournemants/:tid/rounds" => "rounds#create"
  delete "tournemants/:tid/rounds/:rid" => "rounds#destroy"
  patch "tournemants/:tid/rounds/:rid" => "rounds#update"
  put "tournemants/:tid/rounds" => "rounds#update"
  get "tournemants/:tid/rounds/:rid" => "rounds#show", as: 'round'
  get "tournemants/:tid/rounds/:rid/edit" => "rounds#edit", as: 'edit_round'


  get "tournemants/:tid/rounds/:rid/matches" => "matches#index", as: 'matches'
  get "tournemants/:tid/rounds/:rid/matches/new" => "matches#new", as: 'new_match'
  post "tournemants/:tid/rounds/:rid/matches" => "matches#create"
  delete "tournemants/:tid/rounds/:rid/matches/:mid" => "matches#destroy"
  patch "tournemants/:tid/rounds/:rid/matches/:mid" => "matches#update"
  put "tournemants/:tid/rounds/:rid/matches/:mid" => "matches#update"
  get "tournemants/:tid/rounds/:rid/matches/:mid" => "matches#show", as: 'match'
  get "tournemants/:tid/rounds/:rid/matches/:mid/edit" => "matches#edit", as: 'edit_match'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
