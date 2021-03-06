class CreateMotorcycleManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :motorcycle_manufacturers do |t|
      t.string :name
      t.string :headquarters
      t.boolean :usa_made
      t.integer :total_models_all_time

      t.timestamps
    end
  end
end
