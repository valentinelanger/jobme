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

ActiveRecord::Schema.define(version: 20170524175150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "category"
    t.string   "city"
    t.integer  "price"
    t.index ["user_id"], name: "index_jobs_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "destinator_id"
    t.integer  "creator_id"
    t.integer  "job_id"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "request_id",    null: false
    t.index ["creator_id"], name: "index_messages_on_creator_id", using: :btree
    t.index ["destinator_id"], name: "index_messages_on_destinator_id", using: :btree
    t.index ["job_id"], name: "index_messages_on_job_id", using: :btree
    t.index ["request_id"], name: "index_messages_on_request_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "job_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "creator_id",    null: false
    t.integer  "destinator_id", null: false
    t.datetime "confirmed_at"
    t.index ["creator_id"], name: "index_requests_on_creator_id", using: :btree
    t.index ["destinator_id"], name: "index_requests_on_destinator_id", using: :btree
    t.index ["job_id"], name: "index_requests_on_job_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "creator_id"
    t.string   "title"
    t.text     "content"
    t.integer  "rating"
    t.integer  "destinator_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["creator_id"], name: "index_reviews_on_creator_id", using: :btree
    t.index ["destinator_id"], name: "index_reviews_on_destinator_id", using: :btree
    t.index ["job_id"], name: "index_reviews_on_job_id", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.string   "sexe"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "jobs", "users"
  add_foreign_key "messages", "jobs"
  add_foreign_key "messages", "requests"
  add_foreign_key "messages", "users", column: "creator_id"
  add_foreign_key "messages", "users", column: "destinator_id"
  add_foreign_key "requests", "jobs"
  add_foreign_key "requests", "users", column: "creator_id"
  add_foreign_key "requests", "users", column: "destinator_id"
  add_foreign_key "reviews", "jobs"
  add_foreign_key "reviews", "users", column: "creator_id"
  add_foreign_key "reviews", "users", column: "destinator_id"
end
