class GameStudioGamesController < ApplicationController
  def index
    @game_studio = GameStudio.find(params[:id])
    @games = @game_studio.games
  end
end