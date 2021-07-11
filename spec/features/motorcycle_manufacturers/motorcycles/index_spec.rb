require 'rails_helper'

RSpec.describe "Motorcycle manufacturer's motorcycles index" do
  before :each do
    @zero = MotorcycleManufacturer.create!(name: 'Zero', headquarters: 'Santa Cruz, California', usa_made: true, total_models_all_time: 29)
    @harley_davidson = MotorcycleManufacturer.create!(name: 'Harley Davidson', headquarters: 'Milwaukee, Wisconsin', usa_made: true, total_models_all_time: 1_615)
    @srs = Motorcycle.create!(model: 'SR/S', price: 19_995.0, electric: true, motorcycle_manufacturer_id: @zero.id)
    @dsr = Motorcycle.create!(model: 'DSR', price: 15_495.0, electric: true, motorcycle_manufacturer_id: @zero.id)
  end

  it "displays each motorcycle and it's attributes, associated with the motorcycle manufacturer's id(user story 5)" do
    #  As a visitor
    #  When I visit '/motorcycle_manufacturers/:motorcycle_manufacturer_id/motorcycles'
    #  Then I see each motorcycle that is associated with that manufacturer with each motorcycle's attributes:
    visit "/motorcycle_manufacturers/#{@zero.id}/motorcycles"

    expect(page).to have_content(@zero.name)
    expect(page).to have_content(@srs.model)
    expect(page).to have_content("Price: #{@srs.price}")
    expect(page).to have_content("Electric?: #{@srs.electric}")
    expect(page).to have_content("Motorcycle manufacturer id: #{@srs.motorcycle_manufacturer_id}")
  end
end
