require 'rails_helper'

RSpec.describe Motorcycle do
  describe 'validations' do
    it {should validate_presence_of :model}
    it {should validate_presence_of :price}
    it {should allow_value(true).for(:electric)}
    it {should allow_value(false).for(:electric)}
    it {should_not allow_value(nil).for(:electric)}
  end

  describe 'relationships' do
    it {should belong_to :motorcycle_manufacturer}
  end
end
