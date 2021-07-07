class GameStudiosController < ApplicationController
  def index
    @game_studios = GameStudio.all
  end
end