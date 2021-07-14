class Motorcycle < ApplicationRecord
  belongs_to :motorcycle_manufacturer

  validates_presence_of :model,
                        :price

  validates             :electric, inclusion: [true, false]

  def self.alphabetical
    order(Arel.sql("lower(model)"))
  end

  def self.search(query)
    where("price > #{query}")
  end
end
