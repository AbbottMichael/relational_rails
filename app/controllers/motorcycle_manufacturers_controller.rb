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
    MotorcycleManufacturer.create(motorcycle_manufacturer_params)
    redirect_to "/motorcycle_manufacturers"
  end

  def edit
    @moto_mft = MotorcycleManufacturer.find(params[:id])
  end

  def update
    moto_mft = MotorcycleManufacturer.find(params[:id])
    moto_mft.update(motorcycle_manufacturer_params)
    redirect_to "/motorcycle_manufacturers/#{moto_mft.id}"
  end

  def destroy
    MotorcycleManufacturer.destroy(params[:id])
    redirect_to "/motorcycle_manufacturers"
  end

  def motorcycle_manufacturer_params
    params.permit(:name, :headquarters, :usa_made, :total_models_all_time)
  end
end
