class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :code_name, null: false, index: true
      t.string :address
      t.string :phone
      t.string :domain, null: false, index: true


      t.timestamps
    end
  end
end
