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

ActiveRecord::Schema.define(version: 2020_07_30_212445) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.integer "city_id"
    t.string "name"
    t.string "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_dogs_on_city_id"
  end

  create_table "dogsitters", force: :cascade do |t|
    t.integer "city_id"
    t.string "name"
    t.string "sex"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_dogsitters_on_city_id"
  end

  create_table "trolls", force: :cascade do |t|
    t.integer "dogsitter_id"
    t.integer "dog_id"
    t.integer "city_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_trolls_on_city_id"
    t.index ["dog_id"], name: "index_trolls_on_dog_id"
    t.index ["dogsitter_id"], name: "index_trolls_on_dogsitter_id"
  end

end
