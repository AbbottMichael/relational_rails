class GameStudiosController < ApplicationController
  def index
    @game_studios = GameStudio.order("created_at")
  end

  def show
    @game_studio = GameStudio.find(params[:id])
  end

  def new
  end

  def create
    game_studio = GameStudio.create(game_studio_params)
    redirect_to '/game_studios'
  end

  def game_studio_params
    params.permit(:studio_name, :employee_count, :hiring)
  end
end