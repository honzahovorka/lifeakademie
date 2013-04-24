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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130423140213) do

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "name"
    t.string   "surname"
    t.boolean  "email_confirmed",         :default => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
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
  end

end