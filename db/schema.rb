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

ActiveRecord::Schema[7.0].define(version: 2022_02_11_063215) do
  create_table "accounts", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "case_counts", force: :cascade do |t|
    t.integer "total_cases"
    t.integer "total_recoveries"
    t.integer "active_cases"
    t.integer "daily_new"
    t.integer "daily_recovered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journals", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quarantine_logs", force: :cascade do |t|
    t.string "status"
    t.date "date"
    t.integer "user_id"
    t.integer "result_log_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "result_logs", force: :cascade do |t|
    t.string "antigen_type"
    t.string "result"
    t.string "brand"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "lastname"
    t.string "middlename"
    t.string "firstname"
    t.string "address"
    t.string "city"
    t.string "cellnumber"
    t.string "gender"
    t.date "birthdate"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
