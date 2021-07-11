class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])
    game.update(game_params)
    redirect_to "/games/#{game.id}"
  end

  private

  def game_params
    params.permit(:game_name, :game_cost, :genre, :multiplatform, :game_studio_id)
  end
end