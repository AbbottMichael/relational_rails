class GameStudiosController < ApplicationController
  def index
    @game_studios = GameStudio.order("created_at")
  end

  def show
    @game_studio = GameStudio.find(params[:id])
  end

end