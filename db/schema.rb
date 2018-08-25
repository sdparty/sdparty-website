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

ActiveRecord::Schema.define(version: 20180825080309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", id: :serial, force: :cascade do |t|
    t.string "kind"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.string "image"
    t.string "title"
    t.text "content"
    t.string "youtube_url"
    t.string "youtube_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "system_type"
  end

  create_table "articles_issues", id: false, force: :cascade do |t|
    t.integer "article_id"
    t.integer "issue_id"
    t.index ["article_id", "issue_id"], name: "index_articles_issues_on_article_id_and_issue_id", unique: true
  end

  create_table "banners", id: :serial, force: :cascade do |t|
    t.integer "position"
    t.string "image"
    t.string "title"
    t.string "button"
    t.string "link"
    t.boolean "published"
  end

  create_table "candidates", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "constituency"
    t.string "avatar"
    t.string "image"
    t.string "help_image"
    t.string "fb_link"
    t.string "help_link"
    t.boolean "published", default: false
    t.text "donate_form"
    t.string "donate_image"
    t.text "job"
    t.text "education"
    t.text "experience"
    t.string "kind"
    t.integer "year"
  end

  create_table "ckeditor_assets", id: :serial, force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "issues", id: :serial, force: :cascade do |t|
    t.integer "position"
    t.string "name"
    t.text "content"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "provider"
    t.string "provider_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
