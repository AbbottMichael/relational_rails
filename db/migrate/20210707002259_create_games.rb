class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :game_name
      t.float :game_cost
      t.string :genre
      t.boolean :multiplatform

      t.timestamps
    end
  end
end
