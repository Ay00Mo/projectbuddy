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

ActiveRecord::Schema[7.0].define(version: 2024_11_14_091651) do
  create_table "cases", charset: "utf8", force: :cascade do |t|
    t.string "reference_number", null: false
    t.string "application_number", null: false
    t.string "country_code", null: false
    t.integer "law_category_id", null: false
    t.integer "category_id", null: false
    t.integer "status_id", null: false
    t.date "beginning_date", null: false
    t.date "deadline", null: false
    t.date "absolute_deadline", null: false
    t.date "request_date"
    t.date "delivery_date"
    t.date "response_date"
    t.date "instruction_date"
    t.date "filing_date"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "internal_contact_id", null: false
    t.index ["internal_contact_id"], name: "index_cases_on_internal_contact_id"
    t.index ["user_id"], name: "index_cases_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "pin_number", null: false
    t.integer "user_type", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cases", "users"
  add_foreign_key "cases", "users", column: "internal_contact_id"
end
