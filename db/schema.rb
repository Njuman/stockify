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

ActiveRecord::Schema.define(version: 2018_11_19_122143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rails_workflow_contexts", force: :cascade do |t|
    t.integer "parent_id"
    t.string "parent_type"
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["parent_id", "parent_type"], name: "rw_context_parents"
  end

  create_table "rails_workflow_errors", force: :cascade do |t|
    t.string "message"
    t.text "stack_trace"
    t.integer "parent_id"
    t.string "parent_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "resolved"
    t.index ["parent_id", "parent_type"], name: "rw_error_parents"
  end

  create_table "rails_workflow_operation_templates", force: :cascade do |t|
    t.string "title"
    t.string "version"
    t.string "uuid"
    t.string "tag"
    t.text "source"
    t.text "dependencies"
    t.string "operation_class"
    t.integer "process_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "async"
    t.integer "child_process_id"
    t.integer "assignment_id"
    t.string "assignment_type"
    t.string "kind"
    t.string "role"
    t.string "group"
    t.text "instruction"
    t.boolean "is_background"
    t.string "type"
    t.string "partial_name"
    t.index ["process_template_id"], name: "rw_ot_to_pt"
    t.index ["uuid"], name: "rw_ot_uuids"
  end

  create_table "rails_workflow_operations", force: :cascade do |t|
    t.integer "status"
    t.boolean "async"
    t.string "version"
    t.string "tag"
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "process_id"
    t.integer "template_id"
    t.text "dependencies"
    t.integer "child_process_id"
    t.integer "assignment_id"
    t.string "assignment_type"
    t.datetime "assigned_at"
    t.string "type"
    t.boolean "is_active"
    t.datetime "completed_at"
    t.boolean "is_background"
    t.index ["process_id"], name: "rw_o_process_ids"
    t.index ["template_id"], name: "rw_o_template_ids"
  end

  create_table "rails_workflow_process_templates", force: :cascade do |t|
    t.string "title"
    t.text "source"
    t.string "uuid"
    t.string "version"
    t.string "tag"
    t.string "manager_class"
    t.string "process_class"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type"
    t.string "partial_name"
    t.index ["uuid"], name: "rw_pt_uuids"
  end

  create_table "rails_workflow_processes", force: :cascade do |t|
    t.integer "status"
    t.string "version"
    t.string "tag"
    t.boolean "async"
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "template_id"
    t.string "type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workflows", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "metadata"
    t.string "status", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
