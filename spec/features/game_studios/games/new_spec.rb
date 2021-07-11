require 'rails_helper'

RSpec.describe 'goes to game studio games new page' do
  before :each do
    @nintendo = GameStudio.create!(
      studio_name: 'Nintendo',
      employee_count: 6_547,
      hiring: true
    )
    @sony = GameStudio.create!(
      studio_name: 'Sony',
      employee_count: 5_000,
      hiring: false
    )
    @super_mario = Game.create!(
      game_name: 'Super Mario World',
      game_cost: 57.99,
      genre: 'platformer',
      multiplatform: false,
      game_studio_id: @nintendo.id
    )
    @spyro = Game.create!(
      game_name: 'Spyro the Dragon',
      game_cost: 49.99,
      genre: 'platformer',
      multiplatform: false,
      game_studio_id: @sony.id
    )
  end

  it 'has games studios game new page' do
    visit "/game_studios/#{@nintendo.id}/games/new"

    expect(current_path).to eq("/game_studios/#{@nintendo.id}/games/new")
  end

  it 'can create a new game from game studio games page' do
    visit "/game_studios/#{@nintendo.id}/games"

    click_link "Create Game"

    expect(current_path).to eq("/game_studios/#{@nintendo.id}/games/new")

    fill_in('Game Name', with: 'Kirby')
    fill_in('Game cost', with: 48.99)
    fill_in('Genre', with: 'Platformer')
    choose('False')
    click_button('Create Game')

    expect(current_path).to eq("/game_studios/#{@nintendo.id}/games")
    expect(page).to have_content('Kirby')
  end
end