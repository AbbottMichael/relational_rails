require 'rails_helper'

RSpec.describe 'view motorcycle manufacturer by ID page' do
  before :each do
    @zero = MotorcycleManufacturer.create!(name: 'Zero', headquarters: 'Santa Cruz, California', usa_made: true, total_models_all_time: 29)
    @harley_davidson = MotorcycleManufacturer.create!(name: 'Harley Davidson', headquarters: 'Milwaukee, Wisconsin', usa_made: true, total_models_all_time: 1_615)
    @srs = Motorcycle.create!(model: 'SR/S', price: 19_995.0, electric: true, motorcycle_manufacturer_id: @zero.id)
  end

  it "displays the motorcycle manufacturer and it's attributes by id (user story 2)" do
    #  As a visitor
    #  When I visit '/motorcycle_manufacturers/:id'
    #  Then I see the motorcycle manufacturer with that id including the motorcycle manufacturer's attributes:
    #  - data from each column that is on the motorcycle_manufacturers table
    visit "/motorcycle_manufacturers/#{@zero.id}"

    expect(page).to have_content(@zero.name)
    expect(page).to have_content("Headquarters: #{@zero.headquarters}")
    expect(page).to have_content("USA made?: #{@zero.usa_made}")
  end

  it "displays the motorcycle manufacturer's motorcycle count (user story 7)" do
    #  As a visitor
    #  When I visit motorcycle manufacturer's show page
    #  I see a count of the number of motorcycles associated with this motorcycle manufacturer
    visit "/motorcycle_manufacturers/#{@zero.id}"

    expect(page).to have_content("Motorcycles: #{@zero.motorcycles.count}")
  end

  it "has a link to motorcycle manufacturer's motorcycles (user story 10)" do
    # As a visitor
    # When I visit a motorcycle_manufacturer show page ('/motorcycle_manufacturers/:id')
    # Then I see a link to take me to that motorcycle_manufacturer's `motorcycles` page ('/motorcycle_manufacturers/:id/motorcycles')
    visit "/motorcycle_manufacturers/#{@zero.id}"

    click_link('Motorcycle List')
    expect(current_path).to eq("/motorcycle_manufacturers/#{@zero.id}/motorcycles")
  end

  it 'can delete a motorcycle manufacturer' do
    # (User Story 19) As a visitor
    # When I visit a parent show page
    # Then I see a link to delete the parent
    # When I click the link "Delete Parent"
    # Then a 'DELETE' request is sent to '/parents/:id',
    # the parent is deleted, and all child records are deleted
    # and I am redirected to the parent index page where I no longer see this parent
    visit "/motorcycle_manufacturers/#{@zero.id}"

    click_button("Delete #{@zero.name}")

    expect(page).to_not have_content("#{@zero.name}")

    visit "/motorcycles"

    expect(page).to_not have_content("#{@srs.model}")

  end
end
