class CreateCabs < ActiveRecord::Migration[7.0]
  def change
    create_table :cabs do |t|
      t.string :make
      t.string :model
      t.string :serial_no
      t.string :fleet_no
      t.string :frame_color
      t.string :carriage_color
      t.string :upholstry_color
      t.references :shop, foreign_key: true, null: false

      t.timestamps
    end
  end
end
