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

ActiveRecord::Schema.define(version: 2021_06_08_120320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.boolean "shoe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "shoe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shoe_id"], name: "index_feedbacks_on_shoe_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "outfit_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "outfit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_outfit_categories_on_category_id"
    t.index ["outfit_id"], name: "index_outfit_categories_on_outfit_id"
  end

  create_table "outfits", force: :cascade do |t|
    t.string "brand"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "event_type"
    t.string "walking_time"
    t.index ["user_id"], name: "index_outfits_on_user_id"
  end

  create_table "shoe_categories", force: :cascade do |t|
    t.bigint "shoe_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_shoe_categories_on_category_id"
    t.index ["shoe_id"], name: "index_shoe_categories_on_shoe_id"
  end

  create_table "shoes", force: :cascade do |t|
    t.string "brand"
    t.string "generated_shoe"
    t.bigint "outfit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["outfit_id"], name: "index_shoes_on_outfit_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "feedbacks", "shoes"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "outfit_categories", "categories"
  add_foreign_key "outfit_categories", "outfits"
  add_foreign_key "outfits", "users"
  add_foreign_key "shoe_categories", "categories"
  add_foreign_key "shoe_categories", "shoes"
  add_foreign_key "shoes", "outfits"
end
