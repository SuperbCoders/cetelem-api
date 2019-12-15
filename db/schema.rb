# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_15_131950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "status"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "country", null: false
    t.string "postcode", limit: 20, null: false
    t.string "region", null: false
    t.string "city", null: false
    t.string "street"
    t.string "building", limit: 10
    t.point "location"
    t.bigint "dealer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_id"], name: "index_addresses_on_dealer_id"
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "mark_id", null: false
    t.bigint "model_id", null: false
    t.bigint "modification_id", null: false
    t.bigint "complectation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["complectation_id"], name: "index_cars_on_complectation_id"
    t.index ["mark_id", "model_id", "modification_id", "complectation_id"], name: "uniq_car", unique: true
    t.index ["mark_id"], name: "index_cars_on_mark_id"
    t.index ["model_id"], name: "index_cars_on_model_id"
    t.index ["modification_id"], name: "index_cars_on_modification_id"
  end

  create_table "complectations", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "model_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["model_id"], name: "index_complectations_on_model_id"
    t.index ["name", "model_id"], name: "index_complectations_on_name_and_model_id", unique: true
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string "value"
    t.string "value_type", limit: 20
    t.bigint "dealer_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_id"], name: "index_contact_infos_on_dealer_id"
    t.index ["user_id"], name: "index_contact_infos_on_user_id"
  end

  create_table "dealer_car_extra_options", force: :cascade do |t|
    t.bigint "extra_option_id"
    t.bigint "dealer_car_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_car_id"], name: "index_dealer_car_extra_options_on_dealer_car_id"
    t.index ["extra_option_id"], name: "index_dealer_car_extra_options_on_extra_option_id"
  end

  create_table "dealer_cars", force: :cascade do |t|
    t.string "color"
    t.string "wheel"
    t.string "engine_type"
    t.boolean "metallic"
    t.string "availability"
    t.boolean "custom"
    t.boolean "new", default: true
    t.string "owners_number"
    t.integer "price"
    t.integer "credit_discount"
    t.integer "insurance_discount"
    t.integer "tradein_discount"
    t.integer "max_discount"
    t.string "currency", limit: 10
    t.text "description"
    t.integer "year"
    t.integer "registry_year"
    t.string "vin", limit: 30
    t.integer "run"
    t.string "state", limit: 20
    t.bigint "car_id", null: false
    t.string "owner_type"
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_dealer_cars_on_car_id"
    t.index ["owner_type", "owner_id"], name: "index_dealer_cars_on_owner_type_and_owner_id"
  end

  create_table "dealer_groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dealers", force: :cascade do |t|
    t.string "code"
    t.boolean "official_dealer"
    t.string "legal_name"
    t.string "trade_name"
    t.string "distributor"
    t.boolean "bonus"
    t.text "bonus_description"
    t.boolean "used_car_saling"
    t.string "marks", array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rate", limit: 2
    t.bigint "dealer_group_id"
    t.index ["dealer_group_id"], name: "index_dealers_on_dealer_group_id"
  end

  create_table "default_filters", force: :cascade do |t|
    t.string "title", null: false
    t.json "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "extra_options", force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_extra_options_on_name", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.bigint "dealer_car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_car_id"], name: "index_images_on_dealer_car_id"
  end

  create_table "marks", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_marks_on_name", unique: true
  end

  create_table "models", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "mark_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mark_id"], name: "index_models_on_mark_id"
    t.index ["name", "mark_id"], name: "index_models_on_name_and_mark_id", unique: true
  end

  create_table "modifications", force: :cascade do |t|
    t.string "name", null: false
    t.string "engine_type"
    t.integer "engine_hp"
    t.float "engine_volume"
    t.string "body_type"
    t.integer "doors_count"
    t.string "drive"
    t.string "gearbox"
    t.string "years"
    t.bigint "model_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["model_id"], name: "index_modifications_on_model_id"
    t.index ["name", "body_type", "doors_count", "engine_type", "engine_hp", "drive", "gearbox", "years"], name: "uniq_modification", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.string "phone", limit: 16
    t.string "email"
    t.bigint "dealer_car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "client_id"
    t.index ["dealer_car_id"], name: "index_reservations_on_dealer_car_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "password_digest"
    t.integer "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "dealer_id"
    t.index ["dealer_id"], name: "index_users_on_dealer_id"
    t.index ["login"], name: "index_users_on_login", unique: true
  end

  create_table "working_hours", force: :cascade do |t|
    t.string "mon_fr_from"
    t.string "mon_fr_till"
    t.string "sat_from"
    t.string "sat_till"
    t.string "sun_from"
    t.string "sun_till"
    t.bigint "dealer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_id"], name: "index_working_hours_on_dealer_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "dealers"
  add_foreign_key "cars", "complectations"
  add_foreign_key "cars", "marks"
  add_foreign_key "cars", "models"
  add_foreign_key "cars", "modifications"
  add_foreign_key "complectations", "models"
  add_foreign_key "contact_infos", "dealers"
  add_foreign_key "contact_infos", "users"
  add_foreign_key "dealer_car_extra_options", "dealer_cars"
  add_foreign_key "dealer_car_extra_options", "extra_options"
  add_foreign_key "dealer_cars", "cars"
  add_foreign_key "dealers", "dealer_groups"
  add_foreign_key "images", "dealer_cars"
  add_foreign_key "models", "marks"
  add_foreign_key "modifications", "models"
  add_foreign_key "reservations", "dealer_cars"
  add_foreign_key "users", "dealers"
  add_foreign_key "working_hours", "dealers"
end
