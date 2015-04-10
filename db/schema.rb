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

ActiveRecord::Schema.define(version: 20150409234209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "amenities", ["name"], name: "index_amenities_on_name", unique: true, using: :btree

  create_table "home_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "home_types", ["name"], name: "index_home_types_on_name", unique: true, using: :btree

  create_table "listing_amenities", force: :cascade do |t|
    t.integer  "listing_id", null: false
    t.integer  "amenity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "listing_amenities", ["amenity_id"], name: "index_listing_amenities_on_amenity_id", using: :btree
  add_index "listing_amenities", ["listing_id", "amenity_id"], name: "index_listing_amenities_on_listing_id_and_amenity_id", unique: true, using: :btree
  add_index "listing_amenities", ["listing_id"], name: "index_listing_amenities_on_listing_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.integer  "owner_id",       null: false
    t.string   "title",          null: false
    t.integer  "price",          null: false
    t.integer  "capacity",       null: false
    t.string   "address",        null: false
    t.text     "description",    null: false
    t.integer  "cover_photo_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "home_type_id",   null: false
    t.integer  "bedrooms",       null: false
    t.integer  "beds",           null: false
    t.integer  "bathrooms",      null: false
    t.float    "lat",            null: false
    t.float    "lng",            null: false
  end

  add_index "listings", ["home_type_id"], name: "index_listings_on_home_type_id", using: :btree
  add_index "listings", ["owner_id"], name: "index_listings_on_owner_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id",                        null: false
    t.integer  "listing_id",                     null: false
    t.datetime "start_date",                     null: false
    t.datetime "end_date",                       null: false
    t.string   "status",     default: "PENDING", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "guests",                         null: false
  end

  add_index "reservations", ["listing_id"], name: "index_reservations_on_listing_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "listing_id", null: false
    t.integer  "user_id",    null: false
    t.text     "body",       null: false
    t.integer  "rating",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["listing_id", "user_id"], name: "index_reviews_on_listing_id_and_user_id", unique: true, using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "token",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", unique: true, using: :btree
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
