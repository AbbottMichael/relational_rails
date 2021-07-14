class GameStudioGamesController < ApplicationController
  def index
    @game_studio = GameStudio.find(params[:id])

    if params[:order]
      @games = @game_studio.games.sort_by_type(params[:order])
    elsif params[:search] && (params[:search].to_i).positive?
      @games = @game_studio.games.search(params[:search])
    else
      @games = @game_studio.games.all
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