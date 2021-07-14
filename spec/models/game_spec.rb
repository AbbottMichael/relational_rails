require 'rails_helper'

RSpec.describe Game do
  describe 'validations' do
    it {should validate_presence_of :game_name}
    it {should validate_presence_of :game_cost}
    it {should validate_presence_of :genre}
    it {should allow_value(true).for(:multiplatform)}
    it {should allow_value(false).for(:multiplatform)}
    it {should_not allow_value(nil).for(:multiplatform)}
  end

  describe 'relationships' do
    it {should belong_to :game_studio}
  end

  describe 'method' do
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

    it 'can sort games by name' do
      expect(@nintendo.games.sort_by_name).to eq([@donkey_kong, @kirby, @super_mario, @zelda])
    end

    it 'can sort games by cost' do
      expect(@nintendo.games.sort_by_cost).to eq([@super_mario, @donkey_kong, @zelda, @kirby])
    end

    it 'can filter games by cost' do
      expect(@nintendo.games.search(50)).to eq([@kirby, @zelda])
    end
  end
end