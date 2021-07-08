Rails.application.routes.draw do
  
  get '/game_studios', to: 'game_studios#index'
  get '/game_studios/:id', to: "game_studios#show"

  get '/motorcycle_manufacturers', to: 'motorcycle_manufacturers#index'
end
