require 'rails_helper'

RSpec.describe 'view game studios index page' do
  before :each do
    @nintendo = GameStudio.create!(studio_name: 'Nintendo', employee_count: 6_547, hiring: true)
    @sony = GameStudio.create!(studio_name: 'Sony', employee_count: 5_000, hiring: false)
  end
  
  it 'displays all game studios(user story 1)' do
#     For game_studios table
#     As a visitor
#     When I visit '/game_studios'
#     Then I see the name of each game studio record in the system
    visit "/game_studios"

    expect(page).to have_content(@nintendo.studio_name)
    expect(page).to have_content(@sony.studio_name)
  end
end