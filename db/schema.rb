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

ActiveRecord::Schema.define(version: 2018_12_11_131820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_availabilities", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "meal_event_id"
    t.bigint "city_id"
    t.string "status"
    t.boolean "plus_one"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_meal_availabilities_on_city_id"
    t.index ["meal_event_id"], name: "index_meal_availabilities_on_meal_event_id"
    t.index ["user_id"], name: "index_meal_availabilities_on_user_id"
  end

  create_table "meal_events", force: :cascade do |t|
    t.bigint "interest_id"
    t.date "reservation_date"
    t.time "reservation_time"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_meal_events_on_interest_id"
    t.index ["restaurant_id"], name: "index_meal_events_on_restaurant_id"
  end

  create_table "restaurant_cuisines", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.bigint "cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuisine_id"], name: "index_restaurant_cuisines_on_cuisine_id"
    t.index ["restaurant_id"], name: "index_restaurant_cuisines_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "latitude"
    t.string "longitude"
    t.integer "avg_price"
    t.string "website"
    t.string "currency"
    t.integer "zomato_restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_contacts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "contact"
    t.boolean "sharable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_contacts_on_user_id"
  end

  create_table "user_cuisines", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuisine_id"], name: "index_user_cuisines_on_cuisine_id"
    t.index ["user_id"], name: "index_user_cuisines_on_user_id"
  end

  create_table "user_interests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "interest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_user_interests_on_interest_id"
    t.index ["user_id"], name: "index_user_interests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "gender"
    t.integer "age"
    t.string "photo"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "meal_availabilities", "cities"
  add_foreign_key "meal_availabilities", "meal_events"
  add_foreign_key "meal_availabilities", "users"
  add_foreign_key "meal_events", "interests"
  add_foreign_key "meal_events", "restaurants"
  add_foreign_key "restaurant_cuisines", "cuisines"
  add_foreign_key "restaurant_cuisines", "restaurants"
  add_foreign_key "user_contacts", "users"
  add_foreign_key "user_cuisines", "cuisines"
  add_foreign_key "user_cuisines", "users"
  add_foreign_key "user_interests", "interests"
  add_foreign_key "user_interests", "users"
  add_foreign_key "users", "cities"
end
