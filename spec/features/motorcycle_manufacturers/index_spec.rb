require 'rails_helper'

RSpec.describe 'view motorcycle manufacturers page' do
  before :each do
    @zero = MotorcycleManufacturer.create!(name: 'Zero', headquarters: 'Santa Cruz, California', usa_made: true, total_models_all_time: 29)
    @harley_davidson = MotorcycleManufacturer.create!(name: 'Harley Davidson', headquarters: 'Milwaukee, Wisconsin', usa_made: true, total_models_all_time: 1_615)
  end
  
  it 'displays all motorcycle manufacturers(user story 1)' do
    #  For motorcycle_manufacturers table
    #  As a visitor
    #  When I visit '/motorcycle_manufacturers'
    #  Then I see the name of each motorcycle manufacturer record in the system
    visit '/motorcycle_manufacturers'
    save_and_open_page
    expect(page).to have_content(@zero.name)
    expect(page).to have_content(@harley_davidson.name)
  end
end
