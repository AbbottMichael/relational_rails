class MotorcycleManufacturerMotorcyclesController < ApplicationController
  def index
    @motorcycle_manufacturer = MotorcycleManufacturer.find(params[:id])
    @motorcycles = @motorcycle_manufacturer.motorcycles
  end
end
