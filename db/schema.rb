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

ActiveRecord::Schema.define(version: 2019_10_09_001739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "oauths", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "email"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "song_id", null: false
    t.string "game", null: false
    t.string "letter_grade"
    t.integer "main_score"
    t.integer "technical_score"
    t.decimal "percentage_score"
    t.jsonb "detailed_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game"], name: "index_scores_on_game"
    t.index ["main_score"], name: "index_scores_on_main_score"
    t.index ["percentage_score"], name: "index_scores_on_percentage_score"
    t.index ["song_id"], name: "index_scores_on_song_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "game", null: false
    t.string "versions", null: false, array: true
    t.string "jp_name"
    t.string "en_name"
    t.jsonb "scoring"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game", "versions", "en_name"], name: "index_songs_on_game_and_versions_and_en_name"
    t.index ["game", "versions", "jp_name"], name: "index_songs_on_game_and_versions_and_jp_name"
    t.index ["game"], name: "index_songs_on_game"
    t.index ["versions"], name: "index_songs_on_versions", using: :gin
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "scores", "songs"
  add_foreign_key "scores", "users"
end
