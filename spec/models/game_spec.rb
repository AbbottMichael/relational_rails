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
end