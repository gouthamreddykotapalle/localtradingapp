# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_30_002057) do

  create_table "buy_post_detail_schemas", force: :cascade do |t|
    t.string "category"
    t.string "column_id"
    t.string "column_name"
    t.string "datatype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buy_post_details", force: :cascade do |t|
    t.integer "post_id"
    t.integer "field_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_buy_post_details_on_field_id"
    t.index ["post_id"], name: "index_buy_post_details_on_post_id"
  end

  create_table "buy_posts", force: :cascade do |t|
    t.string "title"
    t.string "user_id"
    t.string "category"
    t.text "content"
    t.decimal "price_low"
    t.decimal "price_high"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sell_post_detail_schemas", force: :cascade do |t|
    t.string "category"
    t.string "column_id"
    t.string "column_name"
    t.string "datatype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sell_post_details", force: :cascade do |t|
    t.integer "post_id"
    t.integer "field_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_sell_post_details_on_field_id"
    t.index ["post_id"], name: "index_sell_post_details_on_post_id"
  end

  create_table "sell_posts", force: :cascade do |t|
    t.string "title"
    t.string "user_id"
    t.string "category"
    t.text "content"
    t.decimal "price"
    t.boolean "bargain_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 40
    t.string "password", limit: 512
    t.string "first_name"
    t.string "last_name"
    t.datetime "last_updated"
    t.integer "active_posts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
