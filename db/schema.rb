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

ActiveRecord::Schema.define(version: 2020_07_28_141307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batter_scores", force: :cascade do |t|
    t.bigint "player_id", null: false, comment: "選手ID"
    t.integer "bats", comment: "打席数"
    t.integer "four_dead_ball", comment: "四死球"
    t.integer "bunt", comment: "犠打"
    t.integer "sacrifice_fly", comment: "犠飛"
    t.integer "score", comment: "得点"
    t.integer "hit", comment: "安打(長打含む)"
    t.integer "rbi", comment: "打点"
    t.integer "strikeout", comment: "三振"
    t.integer "steal", comment: "盗塁"
    t.integer "two_bases", comment: "二塁打"
    t.integer "three_bases", comment: "三塁打"
    t.integer "homerun", comment: "本塁打"
    t.integer "error", comment: "失策"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_batter_scores_on_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "own_team_id", null: false, comment: "自チーム"
    t.bigint "opponent_team_id", null: false, comment: "相手チーム"
    t.integer "result", null: false, comment: "勝敗結果"
    t.datetime "matched_at", null: false, comment: "試合日"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["opponent_team_id"], name: "index_games_on_opponent_team_id"
    t.index ["own_team_id"], name: "index_games_on_own_team_id"
  end

  create_table "inning_scores", force: :cascade do |t|
    t.bigint "game_id", null: false, comment: "試合ID"
    t.bigint "team_id", null: false, comment: "チームID"
    t.integer "score", null: false, comment: "得点"
    t.integer "inning", null: false, comment: "イニング"
    t.integer "order", null: false, comment: "表か裏か"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_inning_scores_on_game_id"
    t.index ["team_id"], name: "index_inning_scores_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "last_name", null: false, comment: "姓"
    t.string "first_name", null: false, comment: "名"
    t.integer "number", null: false, comment: "背番号"
    t.bigint "team_id", null: false, comment: "紐付け先のチームid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name", null: false, comment: "ポジション名"
    t.string "name_kanji", null: false, comment: "ポジション名(漢字)"
    t.string "name_short", null: false, comment: "ポジション名(省略)"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false, comment: "チーム名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "base", default: false, null: false, comment: "成績管理をするベースチームかどうか"
  end

  add_foreign_key "batter_scores", "players"
  add_foreign_key "games", "teams", column: "opponent_team_id"
  add_foreign_key "games", "teams", column: "own_team_id"
  add_foreign_key "inning_scores", "games"
  add_foreign_key "inning_scores", "teams"
end
