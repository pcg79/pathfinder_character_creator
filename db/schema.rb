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

ActiveRecord::Schema.define(version: 20150727235836) do

  create_table "adventure_decks", force: :cascade do |t|
    t.string   "number",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string   "name",              null: false
    t.integer  "card_type_id",      null: false
    t.integer  "adventure_deck_id", null: false
    t.text     "text"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "cards", ["adventure_deck_id"], name: "index_cards_on_adventure_deck_id"
  add_index "cards", ["card_type_id"], name: "index_cards_on_card_type_id"

  create_table "characters", force: :cascade do |t|
    t.integer  "weapon_count",   default: 0, null: false
    t.integer  "spell_count",    default: 0, null: false
    t.integer  "armor_count",    default: 0, null: false
    t.integer  "item_count",     default: 0, null: false
    t.integer  "ally_count",     default: 0, null: false
    t.integer  "blessing_count", default: 0, null: false
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
