# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_31_085608) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabs", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "serial_no"
    t.string "fleet_no"
    t.string "frame_color"
    t.string "carriage_color"
    t.string "upholstry_color"
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_cabs_on_shop_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "mfg"
    t.string "part_no"
    t.string "supplier"
    t.string "name", null: false
    t.string "category", null: false
    t.boolean "consumable", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_inventory_items_on_category"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", null: false
    t.string "code_name", null: false
    t.string "address"
    t.string "phone"
    t.string "domain", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_name"], name: "index_shops_on_code_name"
    t.index ["domain"], name: "index_shops_on_domain"
  end

  create_table "stocked_items", force: :cascade do |t|
    t.bigint "inventory_item_id", null: false
    t.string "stockable_type", null: false
    t.bigint "stockable_id", null: false
    t.integer "count", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_item_id"], name: "index_stocked_items_on_inventory_item_id"
    t.index ["stockable_type", "stockable_id"], name: "index_stocked_items_on_stockable"
  end

  add_foreign_key "cabs", "shops"
  add_foreign_key "stocked_items", "inventory_items"
end
