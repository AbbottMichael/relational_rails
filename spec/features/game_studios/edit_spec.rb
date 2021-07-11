require 'rails_helper'

RSpec.describe 'the game studio edit' do
  it 'links to the edit page' do
    game_studio = GameStudio.create!(
      studio_name: 'Konami',
      employee_count: 10_454,
      hiring: true
    )

    visit "/game_studios/#{game_studio.id}"

    click_button "Update #{game_studio.studio_name}"

    expect(current_path).to eq("/game_studios/#{game_studio.id}/edit")
  end

  it 'can edit the game studio' do
    game_studio = GameStudio.create!(
      studio_name: 'Koname',
      employee_count: 10_454,
      hiring: true
    )

    visit "/game_studios/#{game_studio.id}"

    expect(page).to have_content('Koname')

    click_button "Update Koname"

    fill_in('Studio Name', with: 'Konami')
    fill_in('Employee count', with: 5_000)
    choose('False')
    click_button('Update Game Studio')

    expect(current_path).to eq("/game_studios/#{game_studio.id}")
    expect(page).to have_content('Konami')
    expect(page).to have_content('false')
  end
end