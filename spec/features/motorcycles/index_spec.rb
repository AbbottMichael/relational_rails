require 'rails_helper'

RSpec.describe 'view motorcycles page' do
  before :each do
    @zero = MotorcycleManufacturer.create!(name: 'Zero', headquarters: 'Santa Cruz, California', usa_made: true, total_models_all_time: 29)
    @harley_davidson = MotorcycleManufacturer.create!(name: 'Harley Davidson', headquarters: 'Milwaukee, Wisconsin', usa_made: true, total_models_all_time: 1_615)
    @srs = Motorcycle.create!(model: 'SR/S', price: 19_995.0, electric: true, motorcycle_manufacturer_id: @zero.id)
    @dsr = Motorcycle.create!(model: 'DSR', price: 15_495.0, electric: true, motorcycle_manufacturer_id: @zero.id)
    @fat_bob = Motorcycle.create!(model: 'Fat Bob', price: 18_799.0, electric: false, motorcycle_manufacturer_id: @harley_davidson.id)

    visit '/motorcycles'
  end

  it 'displays all motorcycles and their attributes(user story 3)' do
    #  As a visitor
    #  When I visit '/motorcycles'
    #  Then I see each motorcycle in the system including the motorcycle's attributes:
    expect(page).to have_content(@srs.model)
    expect(page).to have_content("Price: #{@srs.price}")
    expect(page).to have_content("Electric?: #{@srs.electric}")
    expect(page).to have_content("Motorcycle manufacturer id: #{@srs.motorcycle_manufacturer_id}")
    expect(page).to_not have_content(@fat_bob.model)
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

  it 'has a seperate link to delete each record' do
    # (user story 23) As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to delete that child
    # When I click the link
    # I should be taken to the `child_table_name` index page where I no longer see that child
    expect(page).to have_content("Delete #{@dsr.model}")

    click_link("Delete #{@srs.model}")

    expect(page).to have_content(@dsr.model)
    expect(page).to_not have_content(@srs.model)
  end
end
