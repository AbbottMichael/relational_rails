require 'rails_helper'

RSpec.describe 'the game edit button' do
  before :each do
    @nintendo = GameStudio.create!(
      studio_name: 'Nintendo',
      employee_count: 6_547,
      hiring: true
    )

    @game = Game.create!(
      game_name: 'Korby',
      game_cost: 59.99,
      genre: 'Platformer',
      multiplatform: false,
      game_studio_id: @nintendo.id
    )
  end

  it 'links to the edit page' do
    visit "/games/#{@game.id}"

    click_button "Update #{@game.game_name}"

    expect(current_path).to eq("/games/#{@game.id}/edit")
  end

  it 'can edit the game' do
    visit "/games/#{@game.id}"

    expect(page).to have_content('Korby')

    visit "/games/#{@game.id}/edit"

    fill_in('Game Name:', with: 'Kirby')
    fill_in('Game cost:', with: 40)
    fill_in('Genre:', with: 'Platformer')
    choose('False')
    click_button('Update Game')

    expect(current_path).to eq("/games/#{@game.id}")
    expect(page).to have_content('Kirby')
  end
end