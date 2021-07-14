class Game < ApplicationRecord
  belongs_to :game_studio

  validates_presence_of :game_name,
                        :game_cost,
                        :genre

  validates             :multiplatform, inclusion: [true, false]

  def self.sort_by_name
    order(Arel.sql("lower(game_name)"))
  end

  def self.sort_by_cost
    order(:game_cost)
  end

  def self.search(search)
    where("game_cost > #{search}")
  end
end