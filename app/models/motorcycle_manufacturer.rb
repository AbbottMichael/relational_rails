class MotorcycleManufacturer < ApplicationRecord
  has_many :motorcycles

  validates_presence_of :name,
                        :headquarters,
                        :total_models_all_time

  validates             :usa_made, inclusion: [true, false]
end
