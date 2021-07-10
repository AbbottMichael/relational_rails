class MotorcycleManufacturersController < ApplicationController
  def index
    @motorcycle_manufacturers = MotorcycleManufacturer.order("created_at")
  end

  def show
    @motorcycle_manufacturer = MotorcycleManufacturer.find(params[:id])
  end
end
