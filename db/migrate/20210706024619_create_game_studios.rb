class CreateGameStudios < ActiveRecord::Migration[5.2]
  def change
    create_table :game_studios do |t|
      t.string :studio_name
      t.integer :employee_count
      t.boolean :hiring
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
