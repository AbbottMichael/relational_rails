class MotorcycleManufacturer < ApplicationRecord
  has_many :motorcycles

  validates_presence_of :name,
                        :headquarters,
                        :usa_made,
                        :total_models_all_time
end
