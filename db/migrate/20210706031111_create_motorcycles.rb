class CreateMotorcycles < ActiveRecord::Migration[5.2]
  def change
    create_table :motorcycles do |t|
      t.integer :motorcycle_manufacturer_id
      t.string :model
      t.float :price
      t.boolean :electric
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
