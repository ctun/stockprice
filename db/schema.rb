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

ActiveRecord::Schema.define(version: 20160516190557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "histories", force: :cascade do |t|
    t.string   "symbol"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "deleted_at"
    t.string   "tags",       limit: 255, array: true
  end

  create_table "purchase_items", id: false, force: :cascade do |t|
    t.integer "id",                      default: "nextval('purchase_items_id_seq'::regclass)", null: false
    t.integer "purchase_id"
    t.integer "product_id"
    t.decimal "price"
    t.integer "quantity"
    t.string  "state",       limit: 255
  end

  create_table "purchases", force: :cascade do |t|
    t.datetime "created_at"
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "state",      limit: 2
    t.integer  "zipcode"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.hstore   "details"
    t.datetime "created_at"
    t.datetime "deleted_at"
  end

  add_foreign_key "purchase_items", "products", name: "purchase_items_product_id_fkey"
  add_foreign_key "purchase_items", "purchases", name: "purchase_items_purchase_id_fkey"
  add_foreign_key "purchases", "users", name: "purchases_user_id_fkey"
end
