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

ActiveRecord::Schema[7.1].define(version: 2024_05_23_133809) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chords", force: :cascade do |t|
    t.string "name"
    t.string "feeling"
    t.string "notes"
    t.string "relationship"
    t.bigint "song_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_chords_on_song_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.bigint "song_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_instruments_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.string "vibe"
    t.string "description"
    t.integer "tempo"
    t.string "form"
    t.text "lyrics"
    t.string "instrumentation"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "password_confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chords", "songs"
  add_foreign_key "instruments", "songs"
  add_foreign_key "songs", "users"
end
