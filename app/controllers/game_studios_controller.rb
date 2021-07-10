class GameStudiosController < ApplicationController
  def index
    @game_studios = GameStudio.all
  end

  def show
    @game_studio = GameStudio.find(params[:id])
  end

end