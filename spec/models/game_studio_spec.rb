require 'rails_helper'

RSpec.describe GameStudio do
  describe 'validations' do
    it {should validate_presence_of :studio_name}
    it {should validate_presence_of :employee_count}
    it {should allow_value(true).for(:hiring)}
    it {should allow_value(false).for(:hiring)}
    it {should_not allow_value(nil).for(:hiring)}
  end

  describe 'relationships' do
    it {should have_many(:games).dependent(:destroy)}
  end
end