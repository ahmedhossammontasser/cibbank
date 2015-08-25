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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150824135025) do

  create_table "companies", :force => true do |t|
    t.string   "company_name"
    t.string   "company_code"
    t.string   "Company_account_no"
    t.string   "Company_account_no_usd", :default => "0"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "employees", :force => true do |t|
    t.string   "employee_name"
    t.string   "employee_branch_code"
    t.string   "employee_account_no"
    t.string   "employee_currency_code"
    t.string   "employee_debit_credit",  :default => "D"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "company_id"
  end

  create_table "payroll_employee", :force => true do |t|
    t.integer  "payroll_id"
    t.integer  "employee_id"
    t.string   "amount"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "payroll_employees", :force => true do |t|
    t.float    "amount",      :default => 0.0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "employee_id"
    t.integer  "payroll_id"
  end

  add_index "payroll_employees", ["employee_id"], :name => "index_payroll_employees_on_employee_id"
  add_index "payroll_employees", ["payroll_id"], :name => "index_payroll_employees_on_payroll_id"

  create_table "payrolls", :force => true do |t|
    t.float    "payroll_amount"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.datetime "payrolls_creation_date"
    t.datetime "payrolls_value_day"
    t.integer  "payrolls_no_employees"
    t.integer  "company_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.datetime "password_changed_at"
    t.string   "user_name"
    t.integer  "company_id",             :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["password_changed_at"], :name => "index_users_on_password_changed_at"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
