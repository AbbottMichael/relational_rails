class MotorcycleManufacturer < ApplicationRecord
  has_many :motorcycles, dependent: :destroy

  validates_presence_of :name,
                        :headquarters,
                        :total_models_all_time

  validates             :usa_made, inclusion: [true, false]
end
