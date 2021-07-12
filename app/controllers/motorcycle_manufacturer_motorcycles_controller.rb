class MotorcycleManufacturerMotorcyclesController < ApplicationController
  def index
    @motorcycle_manufacturer = MotorcycleManufacturer.find(params[:id])
    @moto_mft_id = MotorcycleManufacturer.find(params[:id]).id

    if params[:order] == 'alphabetical'
      @motorcycles = Motorcycle.where(motorcycle_manufacturer_id: @moto_mft_id).order(Arel.sql("lower(model)"))
    else
      @motorcycles = Motorcycle.where(motorcycle_manufacturer_id: @moto_mft_id)
    end
  end

  def new
    @moto_mft = MotorcycleManufacturer.find(params[:id])
  end

  def create
    @moto_mft = MotorcycleManufacturer.find(params[:id])
    Motorcycle.create(motorcycle_params)
    redirect_to "/motorcycle_manufacturers/#{@moto_mft.id}/motorcycles"
  end

  def motorcycle_params
    params.permit(:model, :price, :electric, :motorcycle_manufacturer_id)
  end
end
