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

ActiveRecord::Schema.define(version: 20140107110920) do

  create_table "bars", force: true do |t|
    t.string   "name"
    t.integer  "foo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bars", ["foo_id"], name: "index_bars_on_foo_id"

  create_table "bazs", force: true do |t|
    t.string   "name"
    t.integer  "bar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bazs", ["bar_id"], name: "index_bazs_on_bar_id"

  create_table "foos", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
