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

ActiveRecord::Schema.define(version: 20161125085007) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "picture_url", limit: 255, null: false
    t.string   "slug",        limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "categories", ["slug"], name: "slug_category", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "comment",    limit: 255
    t.integer  "movie_id",   limit: 4,   null: false
    t.integer  "user_id",    limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["movie_id"], name: "index_comment_on_movie_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comment_on_user_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.string   "url_thumbnail", limit: 255
    t.string   "url_video",     limit: 255
    t.integer  "note",          limit: 4
    t.integer  "category_id",   limit: 4,   null: false
    t.string   "slug",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.date     "release"
    t.string   "director",      limit: 255
    t.string   "writer",        limit: 255
    t.string   "actor",         limit: 255
  end

  add_index "movies", ["category_id"], name: "index_movies_on_category_id", using: :btree
  add_index "movies", ["slug"], name: "index_movies_on_slug", unique: true, using: :btree

  create_table "note_movies", force: :cascade do |t|
    t.integer  "note",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "movie_id",   limit: 4, null: false
  end

  add_index "note_movies", ["movie_id"], name: "index_note_movies_on_movie_id", using: :btree
  add_index "note_movies", ["user_id"], name: "index_note_movies_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "admin",                              default: false
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "movies"
  add_foreign_key "comments", "users"
  add_foreign_key "movies", "categories"
  add_foreign_key "note_movies", "movies"
  add_foreign_key "note_movies", "users"
end
