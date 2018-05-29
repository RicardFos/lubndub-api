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

ActiveRecord::Schema.define(version: 20180529172102) do

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meeting_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "sport_id"
    t.string "location"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "status"
    t.integer "exp_level"
    t.string "group_class", default: "No"
    t.string "gender"
    t.integer "min_age"
    t.integer "max_age"
    t.integer "min_users"
    t.integer "max_users"
    t.string "privacy"
    t.string "meeting_event_type"
    t.string "event_type"
    t.integer "country_id", default: 0
    t.string "state"
    t.string "city"
    t.string "zip_code"
    t.string "periodic", default: "No"
    t.string "periodic_interval", default: "WEEK"
    t.string "periodic_run", default: "No"
    t.string "event_auth_token"
    t.index ["event_auth_token"], name: "index_meeting_events_on_event_auth_token", unique: true
  end

  create_table "sports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sport_auth_token"
    t.index ["sport_auth_token"], name: "index_sports_on_sport_auth_token", unique: true
  end

  create_table "user_sport_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "exp_level"
    t.string "group_class"
    t.integer "radius"
    t.string "last_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "sport_id"
    t.index ["sport_id"], name: "index_user_sport_settings_on_sport_id"
    t.index ["user_id", "sport_id"], name: "index_user_sport_settings_on_user_id_and_sport_id", unique: true
    t.index ["user_id"], name: "index_user_sport_settings_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "user_auth_token"
    t.string "gender"
    t.date "date_of_birth"
    t.string "address"
    t.string "city"
    t.integer "country_ID"
    t.integer "state_ID"
    t.string "state_name"
    t.string "zipcode"
    t.float "lat", limit: 24
    t.float "long", limit: 24
    t.index ["user_auth_token"], name: "index_users_on_user_auth_token", unique: true
  end

end
