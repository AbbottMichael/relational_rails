class MotorcycleManufacturerMotorcyclesController < ApplicationController
  def index
    @moto_mft = MotorcycleManufacturer.find(params[:id])

    if params[:order] == 'alphabetical'
      @motorcycles = @moto_mft.motorcycles.alphabetical
    elsif params[:query]
      @motorcycles = @moto_mft.motorcycles.search(params[:query])
    else
      @motorcycles = @moto_mft.motorcycles.all
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
