class GameStudio < ApplicationRecord
  has_many :games

  validates_presence_of :studio_name,
                        :employee_count

  validates             :hiring, inclusion: [true, false]
end