# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_30_164455) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batteries", force: :cascade do |t|
    t.string "capacity"
    t.string "charger"
    t.string "charging"
    t.bigint "product_id", null: false
    t.bigint "specification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_batteries_on_product_id"
    t.index ["specification_id"], name: "index_batteries_on_specification_id"
  end

  create_table "boxes", force: :cascade do |t|
    t.string "phone"
    t.string "handsfree"
    t.string "connector"
    t.string "usb_cable"
    t.string "charger"
    t.string "sim_ejector"
    t.string "guide"
    t.string "protective_case"
    t.string "warranty_card"
    t.string "safety_guide"
    t.bigint "product_id", null: false
    t.bigint "specification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_boxes_on_product_id"
    t.index ["specification_id"], name: "index_boxes_on_specification_id"
  end

  create_table "builds", force: :cascade do |t|
    t.string "os"
    t.string "safety"
    t.string "ui"
    t.string "dimensions"
    t.string "weight"
    t.string "size"
    t.string "finish"
    t.string "sim"
    t.string "colors"
    t.bigint "product_id", null: false
    t.bigint "specification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_builds_on_product_id"
    t.index ["specification_id"], name: "index_builds_on_specification_id"
  end

  create_table "cameras", force: :cascade do |t|
    t.string "main"
    t.string "front"
    t.string "features"
    t.bigint "product_id", null: false
    t.bigint "specification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_cameras_on_product_id"
    t.index ["specification_id"], name: "index_cameras_on_specification_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connectivities", force: :cascade do |t|
    t.string "wlan"
    t.string "bluetooth"
    t.string "gps"
    t.string "radio"
    t.string "usb"
    t.string "nfc"
    t.string "infrared"
    t.string "data"
    t.bigint "product_id", null: false
    t.bigint "specification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_connectivities_on_product_id"
    t.index ["specification_id"], name: "index_connectivities_on_specification_id"
  end

  create_table "displays", force: :cascade do |t|
    t.string "technology"
    t.string "size"
    t.string "resolution"
    t.string "extra_features"
    t.string "refresh_rate"
    t.string "brightness"
    t.string "glass"
    t.bigint "product_id", null: false
    t.bigint "specification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_displays_on_product_id"
    t.index ["specification_id"], name: "index_displays_on_specification_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "sensors"
    t.string "audio"
    t.string "speaker"
    t.string "browser"
    t.string "messaging"
    t.string "games"
    t.string "torch"
    t.string "extra"
    t.bigint "product_id", null: false
    t.bigint "specification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_features_on_product_id"
    t.index ["specification_id"], name: "index_features_on_specification_id"
  end

  create_table "frequencies", force: :cascade do |t|
    t.string "second_generation"
    t.string "third_generation"
    t.string "fourth_generation"
    t.string "fifth_generation"
    t.bigint "product_id", null: false
    t.bigint "specification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_frequencies_on_product_id"
    t.index ["specification_id"], name: "index_frequencies_on_specification_id"
  end

  create_table "memories", force: :cascade do |t|
    t.string "ram"
    t.string "ram_type"
    t.string "storage"
    t.string "storage_type"
    t.string "card"
    t.bigint "product_id", null: false
    t.bigint "specification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_memories_on_product_id"
    t.index ["specification_id"], name: "index_memories_on_specification_id"
  end

  create_table "processors", force: :cascade do |t|
    t.string "cpu"
    t.string "chipset"
    t.string "gpu"
    t.bigint "product_id", null: false
    t.bigint "specification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_processors_on_product_id"
    t.index ["specification_id"], name: "index_processors_on_specification_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "series"
    t.string "description"
    t.string "pictures"
    t.string "price"
    t.bigint "category_id", null: false
    t.bigint "sub_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["sub_category_id"], name: "index_products_on_sub_category_id"
  end

  create_table "specifications", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_specifications_on_product_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batteries", "products"
  add_foreign_key "batteries", "specifications"
  add_foreign_key "boxes", "products"
  add_foreign_key "boxes", "specifications"
  add_foreign_key "builds", "products"
  add_foreign_key "builds", "specifications"
  add_foreign_key "cameras", "products"
  add_foreign_key "cameras", "specifications"
  add_foreign_key "connectivities", "products"
  add_foreign_key "connectivities", "specifications"
  add_foreign_key "displays", "products"
  add_foreign_key "displays", "specifications"
  add_foreign_key "features", "products"
  add_foreign_key "features", "specifications"
  add_foreign_key "frequencies", "products"
  add_foreign_key "frequencies", "specifications"
  add_foreign_key "memories", "products"
  add_foreign_key "memories", "specifications"
  add_foreign_key "processors", "products"
  add_foreign_key "processors", "specifications"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "sub_categories"
  add_foreign_key "specifications", "products"
  add_foreign_key "sub_categories", "categories"
end
