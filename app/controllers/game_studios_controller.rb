class GameStudiosController < ApplicationController
  def index
    @game_studios = GameStudio.order("created_at")
  end

  def show
    @game_studio = GameStudio.find(params[:id])
  end

  def new
    @game_studio = GameStudio.new
  end

  def create
    GameStudio.create!(game_studio_params)
    redirect_to '/game_studios'
  end

  def edit
    @game_studio = GameStudio.find(params[:id])
  end

  def update
    game_studio = GameStudio.find(params[:id])
    game_studio.update(game_studio_params)
    redirect_to "/game_studios/#{game_studio.id}"
  end

  def destroy
    GameStudio.find(params[:id]).destroy
    redirect_to '/game_studios'
  end

  private

  def game_studio_params
    params.require(:game_studio).permit(:studio_name, :employee_count, :hiring)
  end
end
