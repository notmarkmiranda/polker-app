class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :league, null: false, foreign_key: true, type: :uuid
      t.integer :role, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
