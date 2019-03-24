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

ActiveRecord::Schema.define(version: 2019_03_22_153014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "combatants", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_combatants_on_tournament_id"
    t.index ["user_id"], name: "index_combatants_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_matches_on_round_id"
  end

  create_table "points", force: :cascade do |t|
    t.integer "contender_id"
    t.integer "challenger_id"
    t.integer "contender_score"
    t.integer "challenger_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "match_id"
    t.index ["challenger_id"], name: "index_points_on_challenger_id"
    t.index ["contender_id"], name: "index_points_on_contender_id"
    t.index ["match_id"], name: "index_points_on_match_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "number"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_rounds_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.string "description"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tournaments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "combatants", "tournaments"
  add_foreign_key "combatants", "users"
  add_foreign_key "matches", "rounds"
  add_foreign_key "points", "combatants", column: "challenger_id"
  add_foreign_key "points", "combatants", column: "contender_id"
  add_foreign_key "rounds", "tournaments"
  add_foreign_key "tournaments", "users"
end
