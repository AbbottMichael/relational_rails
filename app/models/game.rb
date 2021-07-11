class Game < ApplicationRecord
  belongs_to :game_studio

  validates_presence_of :game_name,
                        :game_cost,
                        :genre

  validates             :multiplatform, inclusion: [true, false]
end