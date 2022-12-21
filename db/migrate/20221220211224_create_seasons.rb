class CreateSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :seasons, id: :uuid, default: "gen_random_uuid()" do |t|
      t.references :league, null: false, foreign_key: true, type: :uuid
      t.boolean :active, default: true
      t.boolean :completed, default: false
      t.integer :number_of_games, default: 0

      t.timestamps
    end
  end
end
