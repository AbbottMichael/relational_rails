# user story 11
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe 'Motorcycle Manufacturer creation' do
  it 'links to the new page from the motorcycle manufacturers index' do
    visit '/motorcycle_manufacturers'

    click_link('New Motorcycle Manufacturer')
    expect(current_path).to eq('/motorcycle_manufacturers/new')
  end

  it 'can create a new motorcycle manufacturer' do
    visit '/motorcycle_manufacturers/new'
    fill_in('Name', with: 'Triumph')
    fill_in('Headquarters', with: 'England')
    choose('True') # usa_made? radio button
    fill_in('Total models all time', with: 872)

    click_button('Create Motorcycle Manufacturer')

    expect(current_path).to eq("/motorcycle_manufacturers")
    expect(page).to have_content('Triumph')
  end
end
