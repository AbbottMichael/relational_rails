# User story 13
# As a visitor
# When I visit a motorcycle manufacturers motorcycle Index page
# Then I see a link to add a new adoptable motorcycle for that motorcycle_manufacturer "Create Motorcycle"
# When I click the link
# I am taken to '/motorcycle_manufacturers/:motorcycle_manufacturer_id/motorcycles/new' where I see a form to add a new adoptable motorcycle
# When I fill in the form with the motorcycle's attributes:
# And I click the button "Create Motorcycle"
# Then a `POST` request is sent to '/motorcycle_manufacturers/:motorcycle_manufacturer_id/motorcycles',
# a new motorcycle object/row is created for that motorcycle_manufacturer,
# and I am redirected to the motorcycle manufacturers motorcycle Index page where I can see the new motorcycle listed

require "rails_helper"

RSpec.describe 'the motorcycle manufacturers motorcycle creation' do
  before :each do
    @zero = MotorcycleManufacturer.create!(
      name:                  'Zero',
      headquarters:          'Santa Cruz, California',
      usa_made:              true,
      total_models_all_time: 29
    )
    @srs = Motorcycle.create!(model: 'SR/S', price: 19_995.0, electric: true, motorcycle_manufacturer_id: @zero.id)
    @dsr = Motorcycle.create!(model: 'DSR', price: 15_495.0, electric: true, motorcycle_manufacturer_id: @zero.id)
  end

  it 'links to the create new motorcycle page' do
    visit "/motorcycle_manufacturers/#{@zero.id}/motorcycles"

    click_link('Create Motorcycle')
    expect(current_path).to eq("/motorcycle_manufacturers/#{@zero.id}/motorcycles/new")
  end

  it 'can create a new adoptable motorcycle for the manufacturer' do
    visit "/motorcycle_manufacturers/#{@zero.id}/motorcycles/new"
    save_and_open_page
    fill_in('Model', with: 'DSR')
    fill_in('Price', with: 10000)
    choose('True') # electric? radio button

    click_button('Create Motorcycle')

    expect(current_path).to eq("/motorcycle_manufacturers/#{@zero.id}/motorcycles")
    expect(page).to have_content('DSR')
  end
end
