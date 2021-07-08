require 'rails_helper'

RSpec.describe 'view motorcycles page' do
  before :each do
    @zero = MotorcycleManufacturer.create!(name: 'Zero', headquarters: 'Santa Cruz, California', usa_made: true, total_models_all_time: 29)
    @harley_davidson = MotorcycleManufacturer.create!(name: 'Harley Davidson', headquarters: 'Milwaukee, Wisconsin', usa_made: true, total_models_all_time: 1_615)
    @srs = Motorcycle.create!(model: 'SR/S', price: 19_995.0, electric: true, motorcycle_manufacturer_id: @zero.id)
    @fat_bob = Motorcycle.create!(model: 'Fat Bob', price: 18_799.0, electric: false, motorcycle_manufacturer_id: @harley_davidson.id)
  end

  it 'displays all motorcycles and their attributes(user story 3)' do
    #  As a visitor
    #  When I visit '/motorcycles'
    #  Then I see each motorcycle in the system including the motorcycle's attributes:
    visit '/motorcycles'
    save_and_open_page

    expect(page).to have_content(@srs.model)
    expect(page).to have_content("Price: #{@srs.price}")
    expect(page).to have_content("Electric?: #{@srs.electric}")
    expect(page).to have_content("Created at: #{@srs.created_at}")
    expect(page).to have_content("Updated at: #{@srs.updated_at}")
    expect(page).to have_content("Motorcycle manufacturer id: #{@srs.motorcycle_manufacturer_id}")
    expect(page).to have_content(@fat_bob.model)
    expect(page).to have_content("Price: #{@fat_bob.price}")
    expect(page).to have_content("Electric?: #{@fat_bob.electric}")
    expect(page).to have_content("Created at: #{@fat_bob.created_at}")
    expect(page).to have_content("Updated at: #{@fat_bob.updated_at}")
    expect(page).to have_content("Motorcycle manufacturer id: #{@fat_bob.motorcycle_manufacturer_id}")
  end
end
