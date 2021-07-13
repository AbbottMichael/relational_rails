require 'rails_helper'

RSpec.describe "Motorcycle manufacturer's motorcycles index" do
  before :each do
    @zero = MotorcycleManufacturer.create!(name: 'Zero', headquarters: 'Santa Cruz, California', usa_made: true, total_models_all_time: 29)
    @harley_davidson = MotorcycleManufacturer.create!(name: 'Harley Davidson', headquarters: 'Milwaukee, Wisconsin', usa_made: true, total_models_all_time: 1_615)
    @srs = Motorcycle.create!(model: 'SR/S', price: 19_995.0, electric: true, motorcycle_manufacturer_id: @zero.id)
    @dsr = Motorcycle.create!(model: 'DSR', price: 15_495.0, electric: true, motorcycle_manufacturer_id: @zero.id)

    visit "/motorcycle_manufacturers/#{@zero.id}/motorcycles"
  end

  it "displays each motorcycle and it's attributes, associated with the motorcycle manufacturer's id(user story 5)" do
    #  As a visitor
    #  When I visit '/motorcycle_manufacturers/:motorcycle_manufacturer_id/motorcycles'
    #  Then I see each motorcycle that is associated with that manufacturer with each motorcycle's attributes:
    expect(page).to have_content(@zero.name)
    expect(page).to have_content(@srs.model)
    expect(page).to have_content("Price: #{@srs.price}")
    expect(page).to have_content("Electric?: #{@srs.electric}")
    expect(page).to have_content("Motorcycle manufacturer id: #{@srs.motorcycle_manufacturer_id}")
  end

  it 'displays motorcycles in alphabetical order when link is selected' do
    # (user story 16) As a visitor
    # When I visit the Motorcycle Manufacturer's motorcycles Index Page
    # Then I see a link to sort motorcycles in alphabetical order
    # When I click on the link
    # I'm taken back to the Motorcycle Manufacturer's motorcycles Index Page where I see all of the parent's motorcycles in alphabetical order
    click_link('Sort A - Z')

    expect(current_path).to eq("/motorcycle_manufacturers/#{@zero.id}/motorcycles")
    expect("DSR").to appear_before("SR/S")
  end

  it 'has a seperate link to edit each record' do
    # (User Story 18) As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to edit that child's info
    # When I click the link
    # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
    expect(page).to have_content("Edit #{@dsr.model}")

    click_link("Edit #{@srs.model}")

    expect(current_path).to eq("/motorcycles/#{@srs.id}/edit")
  end
end
