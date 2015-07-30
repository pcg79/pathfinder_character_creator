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

ActiveRecord::Schema.define(version: 20150728005533) do

  create_table "adventure_decks", force: :cascade do |t|
    t.string   "number",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_lists", force: :cascade do |t|
    t.integer "card_id"
    t.integer "deck_id"
  end

  add_index "card_lists", ["card_id"], name: "index_card_lists_on_card_id"
  add_index "card_lists", ["deck_id"], name: "index_card_lists_on_deck_id"

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
    t.integer  "weapons_count",   default: 0, null: false
    t.integer  "spells_count",    default: 0, null: false
    t.integer  "armors_count",    default: 0, null: false
    t.integer  "items_count",     default: 0, null: false
    t.integer  "allies_count",    default: 0, null: false
    t.integer  "blessings_count", default: 0, null: false
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "decks", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "player_id"
    t.integer  "weapons_count"
    t.integer  "spells_count"
    t.integer  "armors_count"
    t.integer  "items_count"
    t.integer  "allies_count"
    t.integer  "blessings_count"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "decks", ["character_id"], name: "index_decks_on_character_id"
  add_index "decks", ["player_id"], name: "index_decks_on_player_id"

  create_table "players", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
