class MotorcycleManufacturersController < ApplicationController
  def index
    @motorcycle_manufacturers = MotorcycleManufacturer.order("created_at")
  end

  def show
    @motorcycle_manufacturer = MotorcycleManufacturer.find(params[:id])
  end

  def new
  end

  def create
    MotorcycleManufacturer.create(
      name:                  params[:name],
      headquarters:          params[:headquarters],
      usa_made:              params[:usa_made],
      total_models_all_time: params[:total_models_all_time]
    )
    redirect_to "/motorcycle_manufacturers"
  end
end
