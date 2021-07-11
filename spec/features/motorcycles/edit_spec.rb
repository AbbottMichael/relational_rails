# User Story 14
# As a visitor
# When I visit a Motorcycle Show page
# Then I see a link to update that Motorcycle "Update Motorcycle"
# When I click the link
# I am taken to '/motorcycles/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Motorcycle"
# Then a `PATCH` request is sent to '/motorcycles/:id',
# the child's data is updated,
# and I am redirected to the Motorcycle Show page where I see the Motorcycle's updated information

require 'rails_helper'

RSpec.describe 'the motorcycle by ID update record' do
  before :each do
    @zero = MotorcycleManufacturer.create!(
      name:                  'Zero',
      headquarters:          'Santa Cruz, California',
      usa_made:              true,
      total_models_all_time: 29
    )
    @srs = Motorcycle.create!(
      model:                      'SR/S',
      price:                      19_995.0,
      electric:                   true,
      motorcycle_manufacturer_id: @zero.id
    )
  end

  it 'links to the update page' do
    visit "/motorcycles/#{@srs.id}"

    click_button "Update Motorcycle"

    expect(current_path).to eq("/motorcycles/#{@srs.id}/edit")
  end

  it 'updates the motorcycle record' do
    visit "/motorcycles/#{@srs.id}/edit"

    fill_in('Model', with: 'Zero')
    fill_in('Price', with: 18000 )
    choose('True') # electric? radio button

    click_button 'Update Motorcycle'

    expect(current_path).to eq("/motorcycles/#{@srs.id}")
    expect(page).to have_content(18_000)
  end
end
