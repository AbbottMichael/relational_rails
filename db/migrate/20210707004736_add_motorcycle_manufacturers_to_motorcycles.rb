class AddMotorcycleManufacturersToMotorcycles < ActiveRecord::Migration[5.2]
  def change
    add_reference :motorcycles, :motorcycle_manufacturer, foreign_key: true
  end
end
