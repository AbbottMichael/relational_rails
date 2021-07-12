class GameStudioGamesController < ApplicationController
  def index
    @game_studio = GameStudio.find(params[:id])
    @studio_id = GameStudio.find(params[:id]).id
    @games = Game.where(game_studio_id: @studio_id)

    if params[:order] == 'alphabetical'
      @games = Game.where(game_studio_id: @studio_id).order("lower(game_name) ASC")
    elsif params[:order] == 'cost'
      @games = Game.where(game_studio_id: @studio_id).order(:game_cost)
    else
      @games = Game.where(game_studio_id: @studio_id)
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