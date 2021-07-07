require 'rails_helper'

RSpec.describe 'view game studios page' do
  it 'displays all game studios(user story 1)' do
#     For game_studios table
#     As a visitor
#     When I visit '/game_studios'
#     Then I see the name of each game studio record in the system
    nintendo = GameStudio.create!(studio_name: 'Nintendo', employee_count: 6_547, hiring: true)
    sony = GameStudio.create!(studio_name: 'Sony', employee_count: 5_000, hiring: false)

    visit '/game_studios'
    save_and_open_page
    expect(page).to have_content(nintendo.studio_name)
    expect(page).to have_content(sony.studio_name)
  end

  it '(user story 2)' do
#     As a visitor
#     When I visit '/game_studios/:id'
#     Then I see the game studio with that id including the game studio's attributes:
#     - data from each column that is on the game_studios table
  end
end