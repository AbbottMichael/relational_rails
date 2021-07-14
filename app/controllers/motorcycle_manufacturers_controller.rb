class MotorcycleManufacturersController < ApplicationController
  def index
    @motorcycle_manufacturers = MotorcycleManufacturer.order("created_at")
  end

  def show
    @motorcycle_manufacturer = MotorcycleManufacturer.find(params[:id])
  end

  def new
    @moto_mft = MotorcycleManufacturer.new
  end

  def create
    MotorcycleManufacturer.create(moto_mft_params)
    redirect_to "/motorcycle_manufacturers"
  end

  def edit
    @moto_mft = MotorcycleManufacturer.find(params[:id])
  end

  def update
    moto_mft = MotorcycleManufacturer.find(params[:id])
    moto_mft.update(moto_mft_params)
    redirect_to "/motorcycle_manufacturers/#{moto_mft.id}"
  end

  def destroy
    MotorcycleManufacturer.destroy(params[:id])
    redirect_to "/motorcycle_manufacturers"
  end

  private

  def moto_mft_params
    params.require(:motorcycle_manufacturer).permit(:name, :headquarters, :usa_made, :total_models_all_time)
  end

  # def moto_mft_params_form
  #   params.require(:moto_mft).permit(:name, :headquarters, :usa_made, :total_models_all_time)
  # end
end
