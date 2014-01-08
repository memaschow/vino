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

ActiveRecord::Schema.define(version: 20140108232031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blockings", force: true do |t|
    t.integer  "user_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "full_day",   default: false
    t.boolean  "confirm"
    t.string   "reason"
    t.integer  "company_id"
    t.integer  "created_by"
  end

  add_index "blockings", ["ends_at"], name: "index_blockings_on_ends_at", using: :btree
  add_index "blockings", ["starts_at"], name: "index_blockings_on_starts_at", using: :btree
  add_index "blockings", ["user_id"], name: "index_blockings_on_user_id", using: :btree

  create_table "calendar_views", force: true do |t|
    t.integer  "company_id"
    t.integer  "minTime",    default: 8
    t.integer  "maxTime",    default: 20
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "calendar_views", ["company_id"], name: "index_calendar_views_on_company_id", using: :btree

  create_table "calls", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "business"
    t.string   "subdomain"
    t.string   "token"
  end

  create_table "contacts", force: true do |t|
    t.string   "username"
    t.string   "company_name"
    t.string   "phone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "message"
  end

  create_table "event_archives", force: true do |t|
    t.integer  "shift_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "number_of_employees"
  end

  create_table "events", force: true do |t|
    t.integer  "shift_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "number_of_employees"
  end

  add_index "events", ["ends_at"], name: "index_events_on_ends_at", using: :btree
  add_index "events", ["shift_id"], name: "index_events_on_shift_id", using: :btree
  add_index "events", ["starts_at"], name: "index_events_on_starts_at", using: :btree

  create_table "notifications", force: true do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.integer  "blocking_id"
    t.boolean  "confirmed"
  end

  add_index "notifications", ["blocking_id"], name: "index_notifications_on_blocking_id", using: :btree
  add_index "notifications", ["company_id"], name: "index_notifications_on_company_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "shifts", force: true do |t|
    t.integer  "working_area_id"
    t.datetime "starttime"
    t.datetime "endtime"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "number_of_employees"
    t.integer  "company_id"
  end

  add_index "shifts", ["company_id"], name: "index_shifts_on_company_id", using: :btree
  add_index "shifts", ["working_area_id"], name: "index_shifts_on_working_area_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_event_relations", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin_generated", default: false
  end

  add_index "user_event_relations", ["event_id", "user_id"], name: "index_user_events_on_event_id_and_user_id", unique: true, using: :btree
  add_index "user_event_relations", ["event_id"], name: "index_user_events_on_event_id", using: :btree
  add_index "user_event_relations", ["user_id"], name: "index_user_events_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                                        null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "hours_per_week"
    t.integer  "company_id"
    t.boolean  "admin",                           default: false
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "vinos", force: true do |t|
    t.string   "name"
    t.string   "discription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "week_days_relations", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "shift_id"
    t.boolean  "monday",     default: true
    t.boolean  "tuesday",    default: true
    t.boolean  "wednesday",  default: true
    t.boolean  "thursday",   default: true
    t.boolean  "friday",     default: true
    t.boolean  "saturday",   default: true
    t.boolean  "sunday",     default: true
  end

  add_index "week_days_relations", ["shift_id"], name: "index_week_days_relations_on_shift_id", using: :btree
  add_index "week_days_relations", ["user_id"], name: "index_week_days_relations_on_user_id", using: :btree

  create_table "work_area_user_relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "working_area_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "work_area_user_relations", ["user_id", "working_area_id"], name: "index_work_area_user_relations_on_user_id_and_working_area_id", unique: true, using: :btree
  add_index "work_area_user_relations", ["user_id"], name: "index_work_area_user_relations_on_user_id", using: :btree
  add_index "work_area_user_relations", ["working_area_id"], name: "index_work_area_user_relations_on_working_area_id", using: :btree

  create_table "working_areas", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "working_areas", ["company_id"], name: "index_working_areas_on_company_id", using: :btree

end
