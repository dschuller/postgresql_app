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

ActiveRecord::Schema.define(:version => 20120113125650) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
    t.integer  "matchdate_id"
  end

  create_table "matchdates", :force => true do |t|
    t.date     "date"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "mobile"
    t.boolean  "is_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_guestplayer"
  end

end
