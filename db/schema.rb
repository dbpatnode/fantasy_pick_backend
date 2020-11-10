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

ActiveRecord::Schema.define(version: 2020_11_06_074352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "joins", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_joins_on_league_id"
    t.index ["user_id"], name: "index_joins_on_user_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "league_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_leagues_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "home_team_name"
    t.integer "home_team_id"
    t.string "away_team_name"
    t.integer "away_team_id"
    t.integer "match_id"
    t.integer "season_id"
    t.integer "current_matchday"
    t.string "status"
    t.integer "matchday"
    t.string "winner"
    t.integer "home_score"
    t.integer "away_score"
    t.integer "halftime_home_score"
    t.integer "halftime_away_score"
    t.integer "overtime_home_score"
    t.integer "overtime_away_score"
    t.integer "penalties_home_score"
    t.integer "penalties_away_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "picks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "match_id", null: false
    t.string "winner"
    t.integer "match_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_picks_on_match_id"
    t.index ["user_id"], name: "index_picks_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "team_id"
    t.string "team_name"
    t.string "crest"
    t.string "website"
    t.integer "founding_year"
    t.string "club_colors"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.string "username"
    t.string "email"
    t.integer "wins"
    t.integer "losses"
    t.integer "draws"
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "joins", "leagues"
  add_foreign_key "joins", "users"
  add_foreign_key "leagues", "users"
  add_foreign_key "picks", "matches"
  add_foreign_key "picks", "users"
end
