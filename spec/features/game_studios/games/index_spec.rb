require 'rails_helper'

RSpec.describe 'goes to game studio games index page' do
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
      game_cost: 40.99,
      genre: 'platformer',
      multiplatform: false,
      game_studio_id: @nintendo.id
    )
    @kirby = Game.create!(
      game_name: 'Kirby',
      game_cost: 57.99,
      genre: 'platformer',
      multiplatform: false,
      game_studio_id: @nintendo.id
    )
    @zelda = Game.create!(
      game_name: 'Zelda',
      game_cost: 54.99,
      genre: 'action-adventure',
      multiplatform: false,
      game_studio_id: @nintendo.id
    )
    @donkey_kong = Game.create!(
      game_name: 'Donkey Kong',
      game_cost: 49.99,
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

  it 'shows index page for each game studios game' do
    visit "/game_studios/#{@nintendo.id}/games"

    expect(page).to have_content(@super_mario.game_name)
    expect(page).to have_content("Game cost: #{@super_mario.game_cost}")
    expect(page).to have_content(@super_mario.genre)
    expect(page).to have_content(@super_mario.multiplatform)
    expect(page).to have_content(@super_mario.created_at)
    expect(page).to have_content(@super_mario.updated_at)
    expect(page).to_not have_content(@spyro.game_name)
  end

  it 'can sort games alphabetically with link' do
    visit "/game_studios/#{@nintendo.id}/games"

    expect('Super Mario World').to appear_before('Kirby')
    expect('Donkey Kong').to_not appear_before('Zelda')

    click_link('Alphabetical')

    expect('Donkey Kong').to appear_before('Kirby')
    expect('Zelda').to_not appear_before('Super Mario World')
  end

  it 'can sort games by cost with link' do
    visit "/game_studios/#{@nintendo.id}/games"

    expect('Super Mario World').to appear_before('Kirby')
    expect('Donkey Kong').to_not appear_before('Zelda')

    click_link('Cost')

    expect('Zelda').to appear_before('Kirby')
    expect('Kirby').to_not appear_before('Donkey Kong')
  end
end