class Game < ApplicationRecord
  belongs_to :game_studio

  validates_presence_of :game_name,
                        :game_cost,
                        :genre

  validates             :multiplatform, inclusion: [true, false]

  def self.sort_by_type(sort_type)
    if sort_type == 'name'
      order(Arel.sql("lower(game_name)"))
    elsif sort_type == 'cost'
      order(:game_cost)
    end
  end

  def self.search(search)
    where("game_cost > #{search}")
  end
end