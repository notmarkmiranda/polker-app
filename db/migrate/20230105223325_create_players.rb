class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players, id: :uuid, default: "gen_random_uuid()" do |t|
      t.references :game, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.integer :finishing_place
      t.float :score, default: 0.0
      t.integer :additional_expense
      t.datetime :finished_at
      t.integer :finishing_order
      t.float :payout, default: 0.0

      t.timestamps
    end
  end
end
