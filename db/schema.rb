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

ActiveRecord::Schema.define(version: 20150906122110) do

  create_table "game_results", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "problem_id"
    t.boolean  "correct"
    t.integer  "consumed_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "result"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "stock_id"
    t.integer  "num_of_words"
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_users", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  add_index "games_users", ["game_id"], name: "index_games_users_on_game_id"
  add_index "games_users", ["user_id"], name: "index_games_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "api_key"
    t.string   "token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
