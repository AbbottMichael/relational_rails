class AddGameStudiosToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :game_studio, foreign_key: true
  end
end
