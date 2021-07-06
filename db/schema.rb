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

ActiveRecord::Schema.define(version: 2021_07_06_031111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_studios", force: :cascade do |t|
    t.string "studio_name"
    t.integer "employee_count"
    t.boolean "hiring"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "game_name"
    t.float "game_cost"
    t.string "genre"
    t.boolean "multi_platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "studio_id"
  end

  create_table "motorcycle_manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "headquarters"
    t.boolean "usa_made"
    t.integer "total_models_all_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motorcycles", force: :cascade do |t|
    t.integer "motorcycle_manufacturer_id"
    t.string "model"
    t.float "price"
    t.boolean "electric"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
