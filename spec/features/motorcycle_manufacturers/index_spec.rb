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
  end

  it 'displays all motorcycle manufacturers(user story 1)' do
    #  For motorcycle_manufacturers index
    #  As a visitor
    #  When I visit '/motorcycle_manufacturers'
    #  Then I see the name of each motorcycle manufacturer record in the system
    visit '/motorcycle_manufacturers'

    expect(page).to have_content(@zero.name)
    expect(page).to have_content(@harley_davidson.name)
    expect(page).to have_content(@triumph.name)
  end

  it 'displays all motorcycle manufacturers ordered by most recently created (user story 6)' do
    #  As a visitor
    #  When I visit the motorcycle_manufacturers index,
    #  I see that records are ordered by most recently created first
    #  And next to each of the records I see when it was created
    visit '/motorcycle_manufacturers'

    expect(page).to have_content(@zero.created_at)
    expect(page).to have_content(@harley_davidson.created_at)
    expect(page).to have_content(@triumph.created_at)
    expect("Zero").to appear_before("Harley Davidson")
    expect("Harley Davidson").to appear_before("Triumph")
  end
end
