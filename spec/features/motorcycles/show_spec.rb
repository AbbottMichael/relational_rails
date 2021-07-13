require 'rails_helper'

RSpec.describe 'view motorcycle by ID page' do
  before :each do
    @zero = MotorcycleManufacturer.create!(name: 'Zero', headquarters: 'Santa Cruz, California', usa_made: true, total_models_all_time: 29)
    @harley_davidson = MotorcycleManufacturer.create!(name: 'Harley Davidson', headquarters: 'Milwaukee, Wisconsin', usa_made: true, total_models_all_time: 1_615)
    @srs = Motorcycle.create!(model: 'SR/S', price: 19_995.0, electric: true, motorcycle_manufacturer_id: @zero.id)
    @dsr = Motorcycle.create!(model: 'DSR', price: 15_495.0, electric: true, motorcycle_manufacturer_id: @zero.id)
    @fat_bob = Motorcycle.create!(model: 'Fat Bob', price: 18_799.0, electric: false, motorcycle_manufacturer_id: @harley_davidson.id)
  end

  it 'displays all motorcycles and their attributes(user story 4)' do
    #   As a visitor
    #   When I visit '/motorcycles/:id'
    #   Then I see the motorcycle with that id including the motorcycles's attributes:
    @zero = MotorcycleManufacturer.create!(name: 'Zero', headquarters: 'Santa Cruz, California', usa_made: true, total_models_all_time: 29)
    @srs = Motorcycle.create!(model: 'SR/S', price: 19_995.0, electric: true, motorcycle_manufacturer_id: @zero.id)

    visit "/motorcycles/#{@srs.id}"

    expect(page).to have_content(@srs.model)
    expect(page).to have_content("Price: #{@srs.price}")
    expect(page).to have_content("Electric?: #{@srs.electric}")
    expect(page).to have_content("Motorcycle manufacturer id: #{@srs.motorcycle_manufacturer_id}")
  end

  it 'can delete a motorcycle' do
    # (user story 20) As a visitor
    # When I visit a child show page
    # Then I see a link to delete the child "Delete Child"
    # When I click the link
    # Then a 'DELETE' request is sent to '/child_table_name/:id',
    # the child is deleted,
    # and I am redirected to the child index page where I no longer see this child
    visit "/motorcycles/#{@srs.id}"

    click_button "Delete #{@srs.model}"

    expect(page).to_not have_content(@srs.model)
    expect(page).to have_content(@dsr.model)
  end
end
