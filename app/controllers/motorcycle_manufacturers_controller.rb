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
    moto_mft = MotorcycleManufacturer.create(
      name:                  params[:name],
      headquarters:          params[:headquarters],
      usa_made:              params[:headquarters],
      total_models_all_time: params[:total_models_all_time]
    )
    redirect_to "/motorcycle_manufacturers"
  end
end
