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

ActiveRecord::Schema.define(version: 20130805072627) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.boolean  "available"
    t.text     "program"
    t.text     "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "city"
    t.float    "price"
    t.string   "course_type"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.string   "variable_symbol"
    t.boolean  "paid"
    t.datetime "paid_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "status"
  end

  add_index "orders", ["course_id"], name: "index_orders_on_course_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "name"
    t.string   "surname"
    t.boolean  "email_confirmed",         default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "street"
    t.string   "city"
    t.string   "postal_code"
    t.string   "phone"
    t.date     "date_of_birth"
    t.string   "place_of_birth"
    t.string   "billing_street"
    t.string   "billing_city"
    t.integer  "billing_postal_code"
    t.string   "company"
    t.string   "ic"
    t.string   "dic"
    t.string   "status"
    t.string   "email_confirmation_hash"
    t.string   "password_reset_hash"
    t.datetime "password_reseted_at"
    t.string   "role",                    default: "user"
  end

end
