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

ActiveRecord::Schema.define(version: 4) do

  create_table "actors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "nationality"
    t.string   "age"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movie_id"
  end

  create_table "comments", force: true do |t|
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "movie_id"
  end

  create_table "movies", force: true do |t|
    t.string   "name"
    t.string   "year"
    t.string   "director"
    t.integer  "length"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "genre"
  end

  create_table "reviews", force: true do |t|
    t.string   "user"
    t.string   "rating"
    t.string   "recommend"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "movie_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "gender"
    t.string   "howdid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
