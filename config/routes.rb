Rails.application.routes.draw do

  get '/game_studios', to: 'game_studios#index'

  get '/motorcycle_manufacturers',     to: 'motorcycle_manufacturers#index'
  get '/motorcycle_manufacturers/:id', to: 'motorcycle_manufacturers#show' 
end
