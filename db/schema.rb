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

ActiveRecord::Schema.define(:version => 20100831112917) do

  create_table "accounts", :force => true do |t|
    t.string   "name",                          :null => false
    t.boolean  "creditor",   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["name"], :name => "index_accounts_on_name", :unique => true

  create_table "entries", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ledger_entries", :force => true do |t|
    t.integer  "account_id",                  :null => false
    t.integer  "entry_id",                    :null => false
    t.decimal  "amount",     :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ledger_entries", ["account_id", "entry_id"], :name => "index_ledger_entries_on_account_id_and_entry_id", :unique => true

end
