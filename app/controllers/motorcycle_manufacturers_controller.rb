class MotorcycleManufacturersController < ApplicationController
  def index
    @motorcycle_manufacturers = MotorcycleManufacturer.all
  end
end