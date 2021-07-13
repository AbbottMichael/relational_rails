class GameStudioGamesController < ApplicationController
  def index
    @game_studio = GameStudio.find(params[:id])

    if params[:order] == 'alphabetical'
      @games = Game.alphabetical(@game_studio.id)
    elsif params[:order] == 'cost'
      @games = Game.where(game_studio_id: @game_studio.id).order(:game_cost)
    else
      @games = Game.where(game_studio_id: @game_studio.id)
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