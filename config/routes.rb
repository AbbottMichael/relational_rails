Rails.application.routes.draw do

  get '/game_studios',          to: 'game_studios#index'
  get '/game_studios/new',      to: 'game_studios#new'
  post '/game_studios',         to: 'game_studios#create'
  get '/game_studios/:id',      to: 'game_studios#show'
  get '/game_studios/:id/edit', to: 'game_studios#edit'
  patch '/game_studios/:id',    to: 'game_studios#update'

  get '/game_studios/:id/games', to: 'game_studio_games#index'

  get '/games', to: 'games#index'
  get '/games/:id', to: 'games#show'

  get '/motorcycle_manufacturers',                     to: 'motorcycle_manufacturers#index'
  get '/motorcycle_manufacturers/new',                 to: 'motorcycle_manufacturers#new'
  get '/motorcycle_manufacturers/:id',                 to: 'motorcycle_manufacturers#show'
  get '/motorcycle_manufacturers/:id/edit',            to: 'motorcycle_manufacturers#edit'
  post '/motorcycle_manufacturers',                    to: 'motorcycle_manufacturers#create'
  patch '/motorcycle_manufacturers/:id',               to: 'motorcycle_manufacturers#update'

  get '/motorcycle_manufacturers/:id/motorcycles',     to: 'motorcycle_manufacturer_motorcycles#index'
  get '/motorcycle_manufacturers/:id/motorcycles/new', to: 'motorcycle_manufacturer_motorcycles#new'
  post '/motorcycle_manufacturers/:id/motorcycles',    to: 'motorcycle_manufacturer_motorcycles#create'

  get '/motorcycles',     to: 'motorcycles#index'
  get '/motorcycles/:id', to: 'motorcycles#show'
end
