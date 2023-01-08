class AddDefaultsToGamesTable < ActiveRecord::Migration[7.0]
  def change
    change_column_default :games, :buy_in, 0
    change_column_default :games, :estimated_player_count, 0
  end
end
