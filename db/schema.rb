# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160525050016) do

  create_table "hike_types", force: :cascade do |t|
    t.string "type"
  end

  create_table "hikes", force: :cascade do |t|
    t.float    "length"
    t.integer  "time_taken"
    t.integer  "rating"
    t.integer  "difficulty"
    t.string   "name"
    t.text     "notes"
    t.integer  "national_park_id"
    t.integer  "hike_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "national_parks", force: :cascade do |t|
    t.string "state"
    t.string "name"
  end

end
