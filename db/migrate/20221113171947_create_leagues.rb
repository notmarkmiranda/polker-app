class CreateLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :leagues, id: :uuid, default: "gen_random_uuid()" do |t|
      t.string :name, null: false
      t.string :location
      t.boolean :is_public, default: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :leagues, :name, unique: true
  end
end
