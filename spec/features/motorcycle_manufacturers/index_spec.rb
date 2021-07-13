require 'rails_helper'

RSpec.describe 'view motorcycle manufacturers page' do
  before :each do
    @zero = MotorcycleManufacturer.create!(
      name:                  'Zero',
      headquarters:          'Santa Cruz, California',
      usa_made:              true,
      total_models_all_time: 29
    )
    @harley_davidson = MotorcycleManufacturer.create!(
      name:                  'Harley Davidson',
      headquarters:          'Milwaukee, Wisconsin',
      usa_made:              true,
      total_models_all_time: 1_615
    )
    @triumph = MotorcycleManufacturer.create!(
      name:                  'Triumph',
      headquarters:          'Hinckley, United Kingdom',
      usa_made:              false,
      total_models_all_time: 831
    )

    visit '/motorcycle_manufacturers'
  end

  it 'displays all motorcycle manufacturers(user story 1)' do
    #  For motorcycle_manufacturers index
    #  As a visitor
    #  When I visit '/motorcycle_manufacturers'
    #  Then I see the name of each motorcycle manufacturer record in the system

    expect(page).to have_content(@zero.name)
    expect(page).to have_content(@harley_davidson.name)
    expect(page).to have_content(@triumph.name)
  end

  it 'displays all motorcycle manufacturers ordered by most recently created (user story 6)' do
    #  As a visitor
    #  When I visit the motorcycle_manufacturers index,
    #  I see that records are ordered by most recently created first
    #  And next to each of the records I see when it was created

    expect(page).to have_content(@zero.created_at)
    expect(page).to have_content(@harley_davidson.created_at)
    expect(page).to have_content(@triumph.created_at)
    expect("Zero").to appear_before("Harley Davidson")
    expect("Harley Davidson").to appear_before("Triumph")
  end

  it 'has an edit link for each motorcycle manufacturer' do
    # (User Story 17) As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to edit that parent's info
    # When I click the link
    # I should be taken to that parents edit page where I can update its information just like in User Story 4
    click_link("Edit #{@zero.name}")

    expect(current_path).to eq("/motorcycle_manufacturers/#{@zero.id}/edit")
  end

  it 'has a delete link for each motorcycle manufacurer' do
    # (user story 22)As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to delete that parent
    # When I click the link
    # I am returned to the Parent Index Page where I no longer see that parent
    expect(page).to have_content("Delete #{@harley_davidson.name}")

    click_link("Delete #{@zero.name}")

    expect(page).to have_content(@harley_davidson.name)
    expect(page).to_not have_content(@zero.name)
  end
end
