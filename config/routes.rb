Rails.application.routes.draw do

  get '/game_studios',     to: 'game_studios#index'
  get '/game_studios/new', to: 'game_studios#new'
  post '/game_studios',    to: 'game_studios#create'
  get '/game_studios/:id', to: 'game_studios#show'

  get '/game_studios/:id/games', to: 'game_studio_games#index'

  get '/games', to: 'games#index'
  get '/games/:id', to: 'games#show'

  get '/motorcycle_manufacturers',                 to: 'motorcycle_manufacturers#index'
  get '/motorcycle_manufacturers/:id',             to: 'motorcycle_manufacturers#show'

  get '/motorcycle_manufacturers/:id/motorcycles', to: 'motorcycle_manufacturer_motorcycles#index'

  get '/motorcycles',     to: 'motorcycles#index'
  get '/motorcycles/:id', to: 'motorcycles#show'
end
