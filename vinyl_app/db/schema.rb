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

ActiveRecord::Schema.define(version: 20150514141420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "playlist_records", force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "record_id"
  end

  add_index "playlist_records", ["playlist_id"], name: "index_playlist_records_on_playlist_id", using: :btree
  add_index "playlist_records", ["record_id"], name: "index_playlist_records_on_record_id", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.string  "name"
    t.string  "genre"
    t.integer "user_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "album_name"
    t.string "artist_name"
    t.string "artist_id"
    t.string "release_year"
    t.string "image_large"
    t.string "image_medium"
    t.string "image_small"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "playlist_records", "playlists"
  add_foreign_key "playlist_records", "records"
end
