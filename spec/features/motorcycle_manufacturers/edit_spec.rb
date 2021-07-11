# User story 12
# As a visitor
# When I visit a motorcycle manufacturer show page
# Then I see a link to update the motorcycle manufacturer "Update Motorcycle Manufacturer"
# When I click the link "Update Motorcycle Manufacturer"
# Then I am taken to '/motorcycle_manufacturers/:id/edit' where I  see a form to edit the motorcycle manufacturer's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/motorcycle_manufacturers/:id',
# the motorcycle manufacturer's info is updated,
# and I am redirected to the Motorcycle Manufacturer's Show page where I see the motorcycle manufacturer's updated info

require 'rails_helper'

RSpec.describe 'the motorcycle manufacturer edit' do
  it 'links to the edit page' do
    zero = MotorcycleManufacturer.create!(
      name:                  'Zero',
      headquarters:          'Santa Cruz, California',
      usa_made:              true,
      total_models_all_time: 29
    )
    visit "/motorcycle_manufacturers/#{zero.id}"
    click_button "Edit #{zero.name}"

    expect(current_path).to eq("/motorcycle_manufacturers/#{zero.id}/edit")
  end

  it 'can edit the motorcycle manufacturer' do
    zero = MotorcycleManufacturer.create!(
      name:                  'Zero Diesel Motorcycles',
      headquarters:          'Santa Cruz, California',
      usa_made:              true,
      total_models_all_time: 29
    )
    visit "/motorcycle_manufacturers/#{zero.id}"

    expect(page).to have_content('Zero Diesel Motorcycles')

    click_button 'Edit Zero Diesel Motorcycles'
save_and_open_page
    fill_in('Name', with: 'Zero')
    click_button 'Update Motorcycle Manufacturer'

    expect(current_path).to eq("/motorcycle_manufacturers/#{zero.id}")
    expect(page).to have_content('Zero')
  end
end
