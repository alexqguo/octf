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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140612020723) do

  create_table "athlete_marks", :force => true do |t|
    t.integer  "athlete_id", :null => false
    t.integer  "mark_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "athlete_marks", ["athlete_id"], :name => "index_athlete_marks_on_athlete_id"
  add_index "athlete_marks", ["mark_id"], :name => "index_athlete_marks_on_mark_id"

  create_table "athletes", :force => true do |t|
    t.string   "name",             :null => false
    t.integer  "graduating_class"
    t.string   "gender"
    t.string   "url"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "athletes", ["slug"], :name => "index_athletes_on_slug"

  create_table "marks", :force => true do |t|
    t.integer  "year",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "athlete_id", :null => false
    t.string   "season"
    t.string   "event_name"
    t.float    "mark"
  end

  create_table "records", :force => true do |t|
    t.string   "gender",        :null => false
    t.string   "season",        :null => false
    t.string   "event",         :null => false
    t.string   "mark",          :null => false
    t.string   "record_holder", :null => false
    t.string   "date_set",      :null => false
    t.string   "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "token",      :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["user_id"], :name => "index_sessions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",        :null => false
    t.string   "password_digest", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "type"
  end

  add_index "users", ["password_digest"], :name => "index_users_on_password_digest", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "url",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
