class Game < ApplicationRecord
  belongs_to :game_studio

  validates_presence_of :game_name,
                        :game_cost,
                        :genre

  validates             :multiplatform, inclusion: [true, false]

  def self.sort_by_name(id)
    where(game_studio_id: id).order(Arel.sql("lower(game_name)"))
  end

  def self.sort_by_cost(id)
    where(game_studio_id: id).order(:game_cost)
  end
end