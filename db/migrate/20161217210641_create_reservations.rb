class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.datetime :slot
      t.date :slotdate
      t.integer :slothour
      t.string :eventname
      t.string :eventtype

      t.timestamps
    end
    add_index :reservations, :slot, unique: true
  end
end
