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

ActiveRecord::Schema.define(version: 2020_03_10_105047) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "user_id"
    t.string "title"
    t.boolean "done", default: false
    t.string "trello_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "project_id"
    t.string "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_reports_on_project_id"
  end

  create_table "sprints", force: :cascade do |t|
    t.bigint "project_id"
    t.string "title"
    t.boolean "done", default: false
    t.string "trello_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_sprints_on_project_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_story_id"
    t.integer "weight"
    t.string "title"
    t.string "content"
    t.string "current_status"
    t.string "trello_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_story_id"], name: "index_tasks_on_user_story_id"
  end

  create_table "user_stories", force: :cascade do |t|
    t.bigint "sprint_id"
    t.boolean "done", default: false
    t.string "title"
    t.string "trello_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sprint_id"], name: "index_user_stories_on_sprint_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "username"
    t.string "avatar_url"
    t.string "profile_url"
    t.string "token"
    t.string "secret"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "projects", "clients"
  add_foreign_key "projects", "users"
  add_foreign_key "reports", "projects"
  add_foreign_key "sprints", "projects"
  add_foreign_key "tasks", "user_stories"
  add_foreign_key "user_stories", "sprints"
end
