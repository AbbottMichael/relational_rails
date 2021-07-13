class MotorcyclesController < ApplicationController

  def index
    @motorcycles = Motorcycle.where(electric: true)
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
  end

  def edit
    @motorcycle = Motorcycle.find(params[:id])
  end

  def update
    motorcycle = Motorcycle.find(params[:id])
    motorcycle.update(motorcycle_params)
    redirect_to "/motorcycles/#{motorcycle.id}"
  end

  def destroy
    Motorcycle.destroy(params[:id])
    redirect_to '/motorcycles'
  end

  def motorcycle_params
    params.permit(:model, :price, :electric)
  end
end
