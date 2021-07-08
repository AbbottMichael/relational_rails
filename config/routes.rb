Rails.application.routes.draw do

  get '/game_studios', to: 'game_studios#index'
  get '/game_studios/:id', to: "game_studios#show"

  get '/games', to: 'games#index'

  get '/motorcycle_manufacturers',     to: 'motorcycle_manufacturers#index'
  get '/motorcycle_manufacturers/:id', to: 'motorcycle_manufacturers#show'

  get '/motorcycles', to: 'motorcycles#index'
end
