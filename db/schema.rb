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

ActiveRecord::Schema.define(version: 20160902005704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "images", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dartboard_file_name"
    t.string   "dartboard_content_type"
    t.integer  "dartboard_file_size"
    t.datetime "dartboard_updated_at"
  end

  create_table "reasons", force: true do |t|
    t.string   "stress_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reminders", force: true do |t|
    t.string   "reminder_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedulers", force: true do |t|
    t.integer  "reminder_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.datetime "frequency"
  end

  add_index "schedulers", ["reminder_id"], name: "index_schedulers_on_reminder_id", using: :btree
  add_index "schedulers", ["user_id"], name: "index_schedulers_on_user_id", using: :btree

  create_table "sensitivities", force: true do |t|
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solutions", force: true do |t|
    t.integer  "reason_id"
    t.integer  "response_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sensitivity_id"
  end

  add_index "solutions", ["reason_id"], name: "index_solutions_on_reason_id", using: :btree
  add_index "solutions", ["response_id"], name: "index_solutions_on_response_id", using: :btree
  add_index "solutions", ["sensitivity_id"], name: "index_solutions_on_sensitivity_id", using: :btree

  create_table "tips", force: true do |t|
    t.string   "tip"
    t.integer  "reminder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tips", ["reminder_id"], name: "index_tips_on_reminder_id", using: :btree

  create_table "triggers", force: true do |t|
    t.string   "content"
    t.integer  "sensitivity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "triggers", ["sensitivity_id"], name: "index_triggers_on_sensitivity_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "handle"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
