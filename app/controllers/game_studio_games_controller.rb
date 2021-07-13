class GameStudioGamesController < ApplicationController
  def index
    @game_studio = GameStudio.find(params[:id])

    if params[:order] == 'alphabetical'
      @games = Game.sort_by_name(@game_studio.id)
    elsif params[:order] == 'cost'
      @games = Game.sort_by_cost(@game_studio.id)
    else
      @games = Game.filter_by_studio(@game_studio.id)
    end
  end

  def new
    @game_studio = GameStudio.find(params[:id])
  end

  def create
    game_studio = GameStudio.find(params[:id])
    Game.create(game_params)
    redirect_to "/game_studios/#{game_studio.id}/games"
  end

  private

  def game_params
    params.permit(:game_name, :game_cost, :genre, :multiplatform, :game_studio_id)
  end
end