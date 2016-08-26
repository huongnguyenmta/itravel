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

ActiveRecord::Schema.define(version: 20160824111954) do

  create_table "amanities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amanity_businesses", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "amanity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "business_events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "business_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "business_roles", force: :cascade do |t|
    t.string   "name"
    t.boolean  "start_time"
    t.boolean  "end_time"
    t.boolean  "phone_number"
    t.boolean  "hotel_class"
    t.integer  "business_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "business_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.integer  "business_role_id"
    t.string   "description"
    t.string   "address"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "place_id"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "phone_number"
    t.string   "hotel_class"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.integer  "target_id"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "following_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "target_id"
    t.integer  "type"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journey_diaries", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "journey_places", force: :cascade do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.text     "description"
    t.datetime "time"
    t.integer  "journey_diary_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "place_suggestions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "description"
    t.integer  "town_id"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.string   "description"
    t.integer  "town_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_businesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "business_id"
    t.string   "title"
    t.text     "content"
    t.integer  "overal_rate"
    t.integer  "price_rate"
    t.integer  "servise_rate"
    t.integer  "location_rate"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "review_places", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.string   "title"
    t.text     "content"
    t.integer  "overal_rate"
    t.integer  "food_rate"
    t.integer  "culture_rate"
    t.integer  "lanscape_rate"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "service_businesses", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price"
    t.integer  "service_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tour_places", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.text     "detail"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "towns", force: :cascade do |t|
    t.integer  "province_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "avatar"
    t.string   "provider"
    t.string   "uid"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
