require 'rails_helper'

RSpec.describe 'view game studios show page' do
  before :each do
    @nintendo = GameStudio.create!(
      studio_name: 'Nintendo',
      employee_count: 6_547,
      hiring: true
    )
    @sony = GameStudio.create!(
      studio_name: 'Sony',
      employee_count: 5_000,
      hiring: true
    )
    @super_mario = Game.create!(
      game_name: 'Super Mario World',
      game_cost: 40.99,
      genre: 'platformer',
      multiplatform: true,
      game_studio_id: @nintendo.id
    )
    @kirby = Game.create!(
      game_name: 'Kirby',
      game_cost: 57.99,
      genre: 'platformer',
      multiplatform: true,
      game_studio_id: @nintendo.id
    )
    @zelda = Game.create!(
      game_name: 'Zelda',
      game_cost: 54.99,
      genre: 'action-adventure',
      multiplatform: true,
      game_studio_id: @nintendo.id
    )
    @donkey_kong = Game.create!(
      game_name: 'Donkey Kong',
      game_cost: 49.99,
      genre: 'platformer',
      multiplatform: true,
      game_studio_id: @nintendo.id
    )
    @spyro = Game.create!(
      game_name: 'Spyro the Dragon',
      game_cost: 49.99,
      genre: 'platformer',
      multiplatform: true,
      game_studio_id: @sony.id
    )
  end

  it 'goes to pages with game studio ids(user story 2)' do
    # As a visitor
    # When I visit '/game_studios/:id'
    # Then I see the game studio with that id including the game studio's attributes:
    # - data from each column that is on the game_studios table
    visit "/game_studios/#{@nintendo.id}"

    expect(page).to have_content(@nintendo.studio_name)
    expect(page).to have_content("Employee Count: #{@nintendo.employee_count}")
    expect(page).to have_content(@nintendo.hiring)
    expect(page).to have_content(@nintendo.created_at)
    expect(page).to have_content(@nintendo.updated_at)
    expect(page).to_not have_content(@sony.studio_name)
  end

  it 'shows how many games belong to the game studio (user story 7)' do
    # As a visitor
    # When I visit a game studio's show page
    # I see a count of the number of games associated with this game studio
    visit "/game_studios/#{@nintendo.id}"

    expect(page).to have_content("Games: #{@nintendo.games.count}")
  end

  it "has a link to game studio's games (user story 10)" do
    # As a visitor
    # When I visit a game_studio show page ('/game_studios/:id')
    # Then I see a link to take me to that game_studio's `games` page ('/game_studios/:id/games')
    visit "/game_studios/#{@nintendo.id}"

    expect(page).to have_link('Games list', href: "/game_studios/#{@nintendo.id}/games")
  end

  it 'has a button to delete the game studio(user story 19)' do
    visit "/game_studios/#{@nintendo.id}"

    expect(page).to have_button('Delete Nintendo')
  end

  it 'can delete the game studio and return to game studio index(user story 19)' do
    visit "/game_studios/#{@nintendo.id}"

    click_button('Delete Nintendo')

    expect(current_path).to eq('/game_studios')
    expect(page).to_not have_content('Nintendo')
  end

  it 'can confirm that children are deleted(user story 19)' do
    visit "/game_studios/#{@nintendo.id}"

    click_button('Delete Nintendo')

    expect(current_path).to eq('/game_studios')
    
    visit '/games'

    expect(page).to have_content(@spyro.game_name)
    expect(page).to_not have_content(@super_mario.game_name)
    expect(page).to_not have_content(@donkey_kong.game_name)
    expect(page).to_not have_content(@zelda.game_name)
    expect(page).to_not have_content(@kirby.game_name)
  end
end
