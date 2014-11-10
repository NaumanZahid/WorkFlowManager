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

ActiveRecord::Schema.define(version: 20141110110609) do

  create_table "lead_state_machines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lead_transitions", force: true do |t|
    t.string   "to_state",                  null: false
    t.text     "metadata",   default: "{}"
    t.integer  "sort_key",                  null: false
    t.integer  "lead_id",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lead_transitions", ["lead_id"], name: "index_lead_transitions_on_lead_id"
  add_index "lead_transitions", ["sort_key", "lead_id"], name: "index_lead_transitions_on_sort_key_and_lead_id", unique: true

  create_table "leads", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_state_machines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_transitions", force: true do |t|
    t.string   "to_state",                  null: false
    t.text     "metadata",   default: "{}"
    t.integer  "sort_key",                  null: false
    t.integer  "payment_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_transitions", ["payment_id"], name: "index_payment_transitions_on_payment_id"
  add_index "payment_transitions", ["sort_key", "payment_id"], name: "index_payment_transitions_on_sort_key_and_payment_id", unique: true

  create_table "payments", force: true do |t|
    t.string   "cash"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states_assigns", force: true do |t|
    t.string   "assigned_to"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states_tasks", id: false, force: true do |t|
    t.integer  "task_id"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.string   "task_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transitions", force: true do |t|
    t.integer  "from_state_id"
    t.integer  "to_state_id"
    t.integer  "workflow_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workflows", force: true do |t|
    t.boolean  "active"
    t.string   "workflow_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
