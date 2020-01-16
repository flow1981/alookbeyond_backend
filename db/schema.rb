# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_15_161711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "constellations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "displayed", default: false
  end

  create_table "satellites", force: :cascade do |t|
    t.string "name"
    t.string "int_designator"
    t.string "norad_cat_name"
    t.bigint "watchlist_id", null: false
    t.bigint "constellation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "displayed", default: false
    t.index ["constellation_id"], name: "index_satellites_on_constellation_id"
    t.index ["watchlist_id"], name: "index_satellites_on_watchlist_id"
  end

  create_table "tles", force: :cascade do |t|
    t.bigint "satellite_id", null: false
    t.string "sat_name"
    t.string "line1"
    t.string "line2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["satellite_id"], name: "index_tles_on_satellite_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "watchlists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "displayed"
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "satellites", "constellations"
  add_foreign_key "satellites", "watchlists"
  add_foreign_key "tles", "satellites"
  add_foreign_key "watchlists", "users"
end
