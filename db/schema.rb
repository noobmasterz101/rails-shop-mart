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

ActiveRecord::Schema.define(version: 2021_09_13_134155) do

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cart_item_mappings", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "sub_cost"
    t.integer "shopping_cart_id"
    t.integer "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "item_name"
    t.index ["item_id"], name: "index_cart_item_mappings_on_item_id"
    t.index ["shopping_cart_id"], name: "index_cart_item_mappings_on_shopping_cart_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "photo_url", null: false
    t.integer "stocks", null: false
    t.decimal "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_item_mappings", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "sub_cost"
    t.integer "order_id"
    t.integer "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_order_item_mappings_on_item_id"
    t.index ["order_id"], name: "index_order_item_mappings_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "cost"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cart_item_mappings", "items"
  add_foreign_key "cart_item_mappings", "shopping_carts"
  add_foreign_key "order_item_mappings", "items"
  add_foreign_key "order_item_mappings", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "shopping_carts", "users"
end
