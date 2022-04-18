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

ActiveRecord::Schema[7.0].define(version: 2022_04_11_222526) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bugs", force: :cascade do |t|
    t.string "issue_title"
    t.text "issue_description"
    t.integer "identified_by"
    t.date "identified_date"
    t.integer "project_id"
    t.integer "assigned_to"
    t.integer "status"
    t.date "status_modified_date"
    t.integer "priority"
    t.date "target_resolution_date"
    t.integer "progress"
    t.date "actual_resolution_date"
    t.text "resolution_summary"
    t.integer "modified_by"
    t.integer "approved_by"
    t.string "image_url"
    t.boolean "approved"
    t.integer "comment_id"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment_text"
    t.integer "created_by"
    t.integer "bug_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.date "start_date"
    t.date "target_end_date"
    t.date "actual_end_date"
    t.integer "created_by"
    t.integer "modified_by"
    t.integer "bug_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.integer "lead_id"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.integer "team_id"
    t.boolean "is_team_lead"
    t.string "avatar"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
