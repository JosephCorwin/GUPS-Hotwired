class CreateStockedItem < ActiveRecord::Migration[7.0]
  def change
    create_table :stocked_items do |t|
      t.references :inventory_item, null: false, foreign_key: true
      t.references :stockable, null: false, polymorphic: true
      t.integer :count, default: 1

      t.timestamps
    end
  end
end
