require 'rails_helper'

RSpec.describe 'view motorcycle manufacturer by ID page' do
  before :each do
    @zero = MotorcycleManufacturer.create!(name: 'Zero', headquarters: 'Santa Cruz, California', usa_made: true, total_models_all_time: 29)
    @harley_davidson = MotorcycleManufacturer.create!(name: 'Harley Davidson', headquarters: 'Milwaukee, Wisconsin', usa_made: true, total_models_all_time: 1_615)
  end

  it "displays the motorcycle manufacturer and it's attributes by id (user story 2)" do
    #  As a visitor
    #  When I visit '/motorcycle_manufacturers/:id'
    #  Then I see the motorcycle manufacturer with that id including the motorcycle manufacturer's attributes:
    #  - data from each column that is on the motorcycle_manufacturers table
    visit "/motorcycle_manufacturers/#{@zero.id}"
    save_and_open_page
    expect(page).to have_content(@zero.name)
    expect(page).to have_content("Headquarters: #{@zero.headquarters}")
    expect(page).to have_content("USA made?: #{@zero.usa_made}")
    expect(page).to have_content("Created at: #{@zero.created_at}")
    expect(page).to have_content("Updated at: #{@zero.updated_at}")
  end
end