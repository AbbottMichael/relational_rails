require 'rails_helper'

RSpec.describe 'view game studios index page' do
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
    @sega = GameStudio.create!(
      studio_name: 'Sega',
      employee_count: 3_238,
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

  it 'displays all game studios(user story 1)' do
    # For game_studios table
    # As a visitor
    # When I visit '/game_studios'
    # Then I see the name of each game studio record in the system
    visit "/game_studios"

    expect(page).to have_content(@nintendo.studio_name)
    expect(page).to have_content(@sony.studio_name)
    expect(page).to have_content(@sega.studio_name)
  end

  it 'displays all game studios ordered by most recently created (user story 6)' do
    #  As a visitor
    #  When I visit the game_studios index,
    #  I see that records are ordered by most recently created first
    #  And next to each of the records I see when it was created
    visit '/game_studios'

    expect("Nintendo").to appear_before("Sega")
    expect("Sony").to_not appear_before("Nintendo")
  end

  it 'has an edit link for each game studio' do
    visit '/game_studios'

    click_link('Edit Nintendo')

    expect(current_path).to eq("/game_studios/#{@nintendo.id}/edit")
  end

  it 'has a button to delete the game studio(user story 22)' do
    visit '/game_studios'

    expect(page).to have_link('Delete Nintendo')
  end

  it 'can delete the game studio and return to game studio index(user story 22)' do
    visit '/game_studios'

    click_link('Delete Nintendo')

    expect(current_path).to eq('/game_studios')
    expect(page).to_not have_content('Nintendo')
  end

  it 'can confirm that children are deleted(user story 22)' do
    visit '/game_studios'

    click_link('Delete Nintendo')

    expect(current_path).to eq('/game_studios')
    
    visit '/games'

    expect(page).to have_content(@spyro.game_name)
    expect(page).to_not have_content(@super_mario.game_name)
    expect(page).to_not have_content(@donkey_kong.game_name)
    expect(page).to_not have_content(@zelda.game_name)
    expect(page).to_not have_content(@kirby.game_name)
  end
end