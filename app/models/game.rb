class Game < ApplicationRecord
  belongs_to :game_studio

  validates_presence_of :game_name,
                        :game_cost,
                        :genre

  validates             :multiplatform, inclusion: [true, false]

  def self.alphabetical(id)
    where(game_studio_id: id).order(Arel.sql("lower(game_name)"))
  end
end