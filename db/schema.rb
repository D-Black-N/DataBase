# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_29_065857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arenas", force: :cascade do |t|
    t.string "stadium_id", null: false
    t.string "name", null: false
    t.integer "capacity", default: 5000
    t.integer "city_id", null: false
    t.index ["stadium_id"], name: "index_arenas_on_stadium_id", unique: true
  end

  create_table "championships", force: :cascade do |t|
    t.string "cham_id", null: false
    t.string "champ", null: false
    t.string "country_id", null: false
    t.index ["cham_id"], name: "index_championships_on_cham_id", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.integer "city_id", null: false
    t.string "name", null: false
    t.string "country_id", null: false
    t.index ["city_id"], name: "index_cities_on_city_id", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_id", null: false
    t.string "name", null: false
    t.index ["country_id"], name: "index_countries_on_country_id", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.string "game_id", null: false
    t.string "team_h", null: false
    t.string "team_a", null: false
    t.string "cham_id", null: false
    t.string "stadium_id", null: false
    t.datetime "game_date", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "num_contract", null: false
    t.string "short_name", null: false
    t.string "name", null: false
    t.integer "t_num", null: false
    t.string "country_id", null: false
    t.string "team_id"
    t.index ["num_contract"], name: "index_players_on_num_contract", unique: true
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "stat_id"
    t.integer "posession"
    t.integer "fouls"
    t.integer "goals"
    t.integer "shots"
    t.string "game_id"
    t.string "team_id"
    t.string "champ_id"
    t.index ["stat_id"], name: "index_statistics_on_stat_id", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_id", null: false
    t.string "name", null: false
    t.string "cham_id", null: false
    t.string "stadium_id", null: false
    t.index ["team_id"], name: "index_teams_on_team_id", unique: true
  end

end
