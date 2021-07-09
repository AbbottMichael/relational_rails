require 'rails_helper'

RSpec.describe Motorcycle do
  describe 'validations' do
    it {should validate_presence_of :model}
    it {should validate_presence_of :price}
    it {should validate_presence_of :electric}
  end

  describe 'relationships' do
    it {should belong_to :motorcycle_manufacturer}
  end
end
