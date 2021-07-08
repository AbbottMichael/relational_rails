require 'rails_helper'

RSpec.describe 'view motorcycles page' do
  it 'displays all motorcycles and their attributes(user story 3)' do
#   As a visitor
#   When I visit '/motorcycles'
#   Then I see each motorcycle in the system including the motorcycle's attributes:
    srs = Motorcycle.create!(name: 'SR/S', price: 19_995, electric: true,)
    fat_bob = Motorcycle.create!(name: 'Fat Bob', price: 18_799, electric: false,)

    visit '/motorcycles'
    save_and_open_page

    expect(page).to have_content(srs.name)
    expect(page).to have_content(Price: "#{srs.price}")
    expect(page).to have_content(Electric?: "#{srs.electric}")
    expect(page).to have_content(fat_bob.name)
    expect(page).to have_content(Price: "#{fat_bob.price}")
    expect(page).to have_content(Price: "#{fat_bob.electric}")
  end
end
