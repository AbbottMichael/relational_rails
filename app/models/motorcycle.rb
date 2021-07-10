class Motorcycle < ApplicationRecord
  belongs_to :motorcycle_manufacturer

  validates_presence_of :model,
                        :price,
                        :electric
end
