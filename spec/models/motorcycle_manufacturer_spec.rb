require 'rails_helper'

RSpec.describe MotorcycleManufacturer do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :headquarters}
    it {should validate_presence_of :usa_made}
    it {should validate_presence_of :total_models_all_time}
  end

  describe 'relationships' do
    it {should have_many :motorcycles}
  end
end
