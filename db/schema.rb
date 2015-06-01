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

ActiveRecord::Schema.define(version: 20150601212000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chains", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.string   "product_name"
    t.integer  "price"
    t.float    "economy"
    t.integer  "chain_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "sheet_id"
    t.datetime "active_from"
    t.datetime "active_till"
  end

  add_index "discounts", ["active_till", "active_from"], name: "index_discounts_on_active_till_and_active_from", using: :btree
  add_index "discounts", ["chain_id"], name: "index_discounts_on_chain_id", using: :btree
  add_index "discounts", ["sheet_id"], name: "index_discounts_on_sheet_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.json     "fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sheet_settings", force: :cascade do |t|
    t.string   "page_with_link_url"
    t.string   "download_link_selector"
    t.integer  "rows_number"
    t.integer  "columns_number"
    t.integer  "margin_left"
    t.integer  "margin_top"
    t.integer  "margin_right"
    t.integer  "margin_bottom"
    t.string   "type"
    t.integer  "chain_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sheet_settings", ["chain_id"], name: "index_sheet_settings_on_chain_id", using: :btree

  create_table "sheets", force: :cascade do |t|
    t.integer  "chain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sheets", ["chain_id"], name: "index_sheets_on_chain_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "address"
    t.time     "opening_at"
    t.time     "closing_at"
    t.integer  "chain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shops", ["chain_id"], name: "index_shops_on_chain_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "discounts", "chains"
end
