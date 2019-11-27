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

ActiveRecord::Schema.define(version: 2019_11_25_175706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "postcode", limit: 20
    t.string "region"
    t.string "distriсt"
    t.string "area"
    t.string "city"
    t.string "locality"
    t.string "building", limit: 10
    t.integer "region_code"
    t.point "location"
    t.bigint "dealer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_id"], name: "index_addresses_on_dealer_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "wheel", limit: 5
    t.integer "year"
    t.bigint "brand_id", null: false
    t.bigint "model_id", null: false
    t.bigint "modification_id", null: false
    t.bigint "complectation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_cars_on_brand_id"
    t.index ["complectation_id"], name: "index_cars_on_complectation_id"
    t.index ["model_id"], name: "index_cars_on_model_id"
    t.index ["modification_id"], name: "index_cars_on_modification_id"
  end

  create_table "complectations", force: :cascade do |t|
    t.string "name"
    t.bigint "model_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["model_id"], name: "index_complectations_on_model_id"
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

  create_table "dealer_cars", force: :cascade do |t|
    t.string "color"
    t.boolean "metallic"
    t.string "availability"
    t.boolean "custom"
    t.integer "owners_number"
    t.integer "credit_discount"
    t.integer "insurance_discount"
    t.integer "tradein_discount"
    t.integer "max_discount"
    t.string "currency", limit: 10
    t.text "description"
    t.integer "registry_year"
    t.string "vin", limit: 30
    t.bigint "car_id", null: false
    t.bigint "dealer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_dealer_cars_on_car_id"
    t.index ["dealer_id"], name: "index_dealer_cars_on_dealer_id"
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
    t.string "brands", array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "extra_options", force: :cascade do |t|
    t.string "name"
    t.bigint "dealer_car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_car_id"], name: "index_extra_options_on_dealer_car_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.bigint "dealer_car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_car_id"], name: "index_images_on_dealer_car_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.string "body_type"
    t.bigint "brand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_models_on_brand_id"
  end

  create_table "modifications", force: :cascade do |t|
    t.string "name"
    t.string "engine_type"
    t.string "drive"
    t.string "gearbox"
    t.bigint "model_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["model_id"], name: "index_modifications_on_model_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "phone", limit: 16
    t.string "email"
    t.bigint "user_id", null: false
    t.bigint "dealer_car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_car_id"], name: "index_reservations_on_dealer_car_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  add_foreign_key "addresses", "dealers"
  add_foreign_key "cars", "brands"
  add_foreign_key "cars", "complectations"
  add_foreign_key "cars", "models"
  add_foreign_key "cars", "modifications"
  add_foreign_key "complectations", "models"
  add_foreign_key "contact_infos", "dealers"
  add_foreign_key "contact_infos", "users"
  add_foreign_key "dealer_cars", "cars"
  add_foreign_key "dealer_cars", "dealers"
  add_foreign_key "extra_options", "dealer_cars"
  add_foreign_key "images", "dealer_cars"
  add_foreign_key "models", "brands"
  add_foreign_key "modifications", "models"
  add_foreign_key "reservations", "dealer_cars"
  add_foreign_key "reservations", "users"
  add_foreign_key "working_hours", "dealers"
end
