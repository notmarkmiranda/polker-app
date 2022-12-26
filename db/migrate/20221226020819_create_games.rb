class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games, id: :uuid, default: "gen_random_uuid()" do |t|
      t.references :season, null: false, foreign_key: true, type: :uuid
      t.datetime :date_time
      t.integer :estimated_player_count
      t.string :location
      t.boolean :completed, default: false
      t.integer :buy_in
      t.boolean :add_ons, default: true
      t.jsonb :payout_schedule

      t.timestamps
    end
  end
end
