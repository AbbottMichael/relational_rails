class CreateMotorcycles < ActiveRecord::Migration[5.2]
  def change
    create_table :motorcycles do |t|
      t.string :model
      t.float :price
      t.boolean :electric

      t.timestamps
    end
  end
end
