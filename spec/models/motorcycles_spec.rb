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

  describe 'methods' do
    before :each do
    @zero = MotorcycleManufacturer.create!(
      name:                  'Zero',
      headquarters:          'Santa Cruz, California',
      usa_made:              true,
      total_models_all_time: 29
    )
    @srs = Motorcycle.create!(
      model:                      'SR/S',
      price:                      19_995.0,
      electric:                   true,
      motorcycle_manufacturer_id: @zero.id
    )
    @dsr = Motorcycle.create!(
      model:                      'DSR',
      price:                      15_995.0,
      electric:                   true,
      motorcycle_manufacturer_id: @zero.id
    )
    end

    it 'can list motorcycles in alphabetical order' do
      expect(@zero.motorcycles.alphabetical).to eq([@dsr, @srs])
    end

    it 'can filter motorcycles by price from input value' do
      expect(@zero.motorcycles.search(16_000)).to eq([@srs])
    end
  end
end
