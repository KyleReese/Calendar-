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

ActiveRecord::Schema.define(version: 20170403032026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_classes", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "event_id"
    t.text     "name"
    t.integer  "metric_class_id"
    t.index ["event_id"], name: "index_event_classes_on_event_id", using: :btree
    t.index ["metric_class_id"], name: "index_event_classes_on_metric_class_id", using: :btree
  end

  create_table "event_classes_events", force: :cascade do |t|
    t.integer "event_class_id"
    t.integer "event_id"
    t.index ["event_class_id"], name: "index_event_classes_events_on_event_class_id", using: :btree
    t.index ["event_id"], name: "index_event_classes_events_on_event_id", using: :btree
  end

  create_table "event_event_classes", force: :cascade do |t|
    t.integer "event_class_id"
    t.integer "event_id"
    t.index ["event_class_id"], name: "index_event_event_classes_on_event_class_id", using: :btree
    t.index ["event_id"], name: "index_event_event_classes_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "event_calendar_id"
    t.integer  "metric_id"
    t.text     "name"
    t.integer  "event_class_id"
    t.index ["event_class_id"], name: "index_events_on_event_class_id", using: :btree
    t.index ["metric_id"], name: "index_events_on_metric_id", using: :btree
  end

  create_table "metric_classes", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "event_class_id"
    t.integer  "metric_type"
    t.text     "name"
  end

  create_table "metrics", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "int_val"
    t.boolean  "boolean_val"
    t.time     "time_val"
    t.string   "metric_type"
    t.text     "name"
    t.integer  "event_id"
    t.integer  "metric_class_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "event_classes", "events"
  add_foreign_key "event_classes", "metric_classes"
  add_foreign_key "events", "event_classes"
  add_foreign_key "events", "metrics"
end
