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

ActiveRecord::Schema.define(version: 20160922081153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_details", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "delete_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "size"
    t.string   "color"
    t.float    "product_price"
    t.string   "fashion_name"
    t.index ["bill_id"], name: "index_bill_details_on_bill_id", using: :btree
    t.index ["product_id"], name: "index_bill_details_on_product_id", using: :btree
  end

  create_table "bills", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "transport_state_id"
    t.integer  "cash_discount"
    t.boolean  "payment_state"
    t.datetime "delete_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.float    "total_price"
    t.string   "payment_price"
    t.index ["customer_id"], name: "index_bills_on_customer_id", using: :btree
    t.index ["transport_state_id"], name: "index_bills_on_transport_state_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "delete_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "country"
    t.string   "city"
    t.float    "total"
    t.datetime "delete_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "product_id"
    t.string   "email"
    t.boolean  "state"
    t.datetime "delete_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_notices_on_customer_id", using: :btree
    t.index ["product_id"], name: "index_notices_on_product_id", using: :btree
  end

  create_table "producers", force: :cascade do |t|
    t.string   "name"
    t.datetime "delete_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "producer_id"
    t.integer  "sex_id"
    t.string   "name"
    t.float    "price"
    t.integer  "quantity"
    t.integer  "cash_discount"
    t.string   "image"
    t.string   "title"
    t.string   "color"
    t.string   "size"
    t.string   "designed"
    t.string   "content"
    t.string   "order_information"
    t.datetime "delete_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["producer_id"], name: "index_products_on_producer_id", using: :btree
    t.index ["sex_id"], name: "index_products_on_sex_id", using: :btree
  end

  create_table "receip_note_details", force: :cascade do |t|
    t.integer  "receip_note_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.float    "price"
    t.datetime "delete_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["product_id"], name: "index_receip_note_details_on_product_id", using: :btree
    t.index ["receip_note_id"], name: "index_receip_note_details_on_receip_note_id", using: :btree
  end

  create_table "receip_notes", force: :cascade do |t|
    t.datetime "delete_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sexes", force: :cascade do |t|
    t.string   "gender"
    t.datetime "delete_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transport_states", force: :cascade do |t|
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.string   "activated_at"
    t.string   "datetime"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "delete_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "authen_token_digest"
    t.index ["authen_token_digest"], name: "index_users_on_authen_token_digest", using: :btree
    t.index ["customer_id"], name: "index_users_on_customer_id", using: :btree
  end

end
