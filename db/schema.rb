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

ActiveRecord::Schema.define(version: 20141121230944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "costs", force: true do |t|
    t.integer  "product_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
  end

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "organization_name"
    t.string   "role"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_groups", force: true do |t|
    t.integer  "total"
    t.integer  "invoice_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_lines", force: true do |t|
    t.integer "invoice_group_id"
    t.integer "line_total"
    t.integer "count"
    t.string  "name"
    t.text    "description"
  end

  create_table "invoices", force: true do |t|
    t.integer  "state"
    t.integer  "customer_id"
    t.integer  "total"
    t.datetime "fail_date"
    t.datetime "pay_date"
    t.datetime "bill_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
  end

  create_table "orders_products", force: true do |t|
    t.integer "product_id"
    t.integer "order_id"
  end

  create_table "prices", force: true do |t|
    t.integer  "product_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
  end

  create_table "product_costs", force: true do |t|
    t.integer  "product_id"
    t.integer  "cost"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "invoice_name"
    t.text     "invoice_description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_groups_products", id: false, force: true do |t|
    t.integer "product_group_id"
    t.integer "product_id"
  end

  create_table "product_licenses", force: true do |t|
    t.integer  "product_id"
    t.integer  "region"
    t.integer  "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "parent_product_type_id"
    t.string   "invoice_name"
    t.text     "invoice_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "invoice_name"
    t.text     "invoice_description"
    t.integer  "product_type_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requirements", force: true do |t|
    t.integer  "requireable_id"
    t.string   "requireable_type"
    t.text     "requirement_rule"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.text     "email"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
