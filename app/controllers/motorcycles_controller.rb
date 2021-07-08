class MotorcyclesController < ApplicationController

  def index
    @motorcycles = Motorcycle.all
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
  end
end
