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

ActiveRecord::Schema.define(version: 20180312173219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.bigint "base_price"
    t.integer "style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "make_id"
    t.index ["make_id"], name: "index_models_on_make_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.bigint "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_options", force: :cascade do |t|
    t.bigint "vehicle_id"
    t.bigint "option_id"
    t.index ["option_id"], name: "index_vehicle_options_on_option_id"
    t.index ["vehicle_id"], name: "index_vehicle_options_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "nickname"
    t.string "color"
    t.bigint "mileage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "price"
    t.bigint "make_id"
    t.bigint "model_id"
    t.index ["make_id"], name: "index_vehicles_on_make_id"
    t.index ["model_id"], name: "index_vehicles_on_model_id"
  end

  add_foreign_key "models", "makes"
  add_foreign_key "vehicle_options", "options"
  add_foreign_key "vehicle_options", "vehicles"
  add_foreign_key "vehicles", "makes"
  add_foreign_key "vehicles", "models"
end
