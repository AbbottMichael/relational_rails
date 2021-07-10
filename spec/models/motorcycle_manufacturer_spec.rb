require 'rails_helper'

RSpec.describe MotorcycleManufacturer do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :headquarters}
    it {should validate_presence_of :total_models_all_time}
    it {should allow_value(true).for(:usa_made)}
    it {should allow_value(false).for(:usa_made)}
    it {should_not allow_value(nil).for(:usa_made)}

    # need to test that :usa_made exists
  end

  describe 'relationships' do
    it {should have_many :motorcycles}
  end
end
