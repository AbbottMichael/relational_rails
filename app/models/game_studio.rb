class GameStudio < ApplicationRecord
  has_many :games, dependent: :destroy

  validates_presence_of :studio_name,
                        :employee_count

  validates             :hiring, inclusion: [true, false]
end