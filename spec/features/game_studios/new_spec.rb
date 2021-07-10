require 'rails_helper'

RSpec.describe 'the Game Studio creation' do
  it 'links to the new page from the game studios index' do
    visit '/game_studios'

    click_link('New Game Studio')
    expect(current_path).to eq('/game_studios/new')
  end

  it 'can create a new game studio' do
    visit '/game_studios/new'

    fill_in('Studio Name', with: 'Konami')
    fill_in('Employee count', with: 10_454)
    choose('True')
    click_button('Create Game Studio')

    expect(current_path).to eq('/game_studios')
    expect(page).to have_content('Konami')
  end
end