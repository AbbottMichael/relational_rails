require 'rails_helper'

RSpec.describe 'view games page' do
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
      multiplatform: true,
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
  
  it 'goes to games page and views attributes' do
    # As a visitor
    # When I visit '/games'
    # Then I see each Games in the system including the Games's attributes:
    visit '/games'

    expect(page).to have_content(@super_mario.game_name)
    expect(page).to have_content("Game cost: #{@super_mario.game_cost}")
    expect(page).to have_content(@super_mario.genre)
    expect(page).to have_content(@super_mario.multiplatform)
    expect(page).to have_content(@super_mario.created_at)
    expect(page).to have_content(@super_mario.updated_at)
    expect(page).to have_content(@super_mario.game_studio_id)
    expect(page).to_not have_content(@spyro.game_name)
  end
end