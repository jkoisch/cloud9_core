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

ActiveRecord::Schema.define(version: 20141230070458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cases", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", force: true do |t|
    t.integer  "product_id"
    t.text     "notes"
    t.integer  "system_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.integer  "quantity",    limit: 8
    t.integer  "customer_id"
  end

  create_table "components_orders", id: false, force: true do |t|
    t.integer "component_id"
    t.integer "order_id"
  end

  create_table "contacts", force: true do |t|
    t.integer "cloud9_customer_id"
    t.string  "email"
    t.boolean "authorized"
    t.boolean "primary"
    t.string  "name"
    t.string  "role"
  end

  create_table "costs", force: true do |t|
    t.integer  "product_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
  end

  create_table "customers", force: true do |t|
    t.string   "organization_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cloud9_identifier"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

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
    t.string  "name"
    t.text    "description"
    t.integer "count",            limit: 8
  end

  create_table "invoices", force: true do |t|
    t.integer  "customer_id"
    t.integer  "total"
    t.datetime "fail_date"
    t.datetime "pay_date"
    t.datetime "bill_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
    t.datetime "error_date"
    t.integer  "workflow_state"
  end

  create_table "measurements", force: true do |t|
    t.integer  "system_id"
    t.text     "raw_metric_data"
    t.integer  "ram"
    t.integer  "cpu"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "average_ram_utilization",           precision: 5, scale: 2
    t.integer  "total_hd_space",          limit: 8
    t.integer  "free_hd_space",           limit: 8
    t.integer  "total_users"
    t.integer  "pagefile_size",           limit: 8
    t.boolean  "dataserver"
    t.string   "datastore_location"
    t.string   "pagefile_location"
  end

  create_table "opportunities", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
    t.integer  "customer_id"
  end

  create_table "prices", force: true do |t|
    t.integer  "product_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
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
    t.string   "status"
    t.text     "notes"
    t.integer  "required_quantity",   limit: 8
    t.boolean  "unit_price"
    t.boolean  "percentage_price"
    t.integer  "contract_percentage"
  end

  create_table "requirements", force: true do |t|
    t.integer  "requireable_id"
    t.string   "requireable_type"
    t.text     "requirement_rule"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salesforce_references", force: true do |t|
    t.string   "salesforce_id"
    t.string   "salesforce_url"
    t.integer  "referenceable_id"
    t.string   "referenceable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems", force: true do |t|
    t.string   "virtual_machine_identifier"
    t.text     "raw_data"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems_users", id: false, force: true do |t|
    t.integer "system_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.text     "email"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
