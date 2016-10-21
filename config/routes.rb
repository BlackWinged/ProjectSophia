Rails.application.routes.draw do
  resources :photowords
  resources :games
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #match '/map_tiles' => 'map_tiles#show' , :via => :get
  match '/map_tiles/' => 'map_tiles#get_tile' , :via => :get

end
