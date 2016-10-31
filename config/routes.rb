Rails.application.routes.draw do
  get 'users/login', to: "users#login"
  post 'users/login', to: "users#checkLogin"
  resources :memory_logs
  resources :users
  resources :games
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #match '/map_tiles' => 'map_tiles#show' , :via => :get
  match '/map_tiles/' => 'map_tiles#get_tile' , :via => :get
end
