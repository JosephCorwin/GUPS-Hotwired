class CreateInventoryItem < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_items do |t|
      t.string :mfg
      t.string :part_no
      t.string :supplier
      t.string :name, null: false
      t.string :category, null: false, index: true
      t.boolean :consumable, default: false

      t.timestamps
    end
  end
end
