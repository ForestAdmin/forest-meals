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

ActiveRecord::Schema.define(version: 20170119155922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chef_availabilities", force: :cascade do |t|
    t.integer  "chef_id"
    t.datetime "available_at"
    t.index ["chef_id"], name: "index_chef_availabilities_on_chef_id", using: :btree
  end

  create_table "chefs", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "stripe_id"
  end

  create_table "delivery_men", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.string   "location"
    t.boolean  "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "geoloc"
  end

  create_table "menus", force: :cascade do |t|
    t.datetime "available_at"
    t.integer  "chef_id"
    t.index ["chef_id"], name: "index_menus_on_chef_id", using: :btree
  end

  create_table "menus_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "menu_id"
    t.index ["menu_id"], name: "index_menus_products_on_menu_id", using: :btree
    t.index ["product_id"], name: "index_menus_products_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "delivery_address"
    t.integer  "status"
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  end

  create_table "orders_products", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.index ["order_id"], name: "index_orders_products_on_order_id", using: :btree
    t.index ["product_id"], name: "index_orders_products_on_product_id", using: :btree
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["product_id"], name: "index_product_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "instructions"
    t.string   "ingredients",        default: [],               array: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "allergens",          default: [],               array: true
    t.integer  "product_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.float    "price",              default: 0.0
  end

end
