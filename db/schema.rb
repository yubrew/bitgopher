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

ActiveRecord::Schema.define(:version => 20130603040400) do

  create_table "messages", :force => true do |t|
    t.string   "message_id",                        :null => false
    t.string   "sender",                            :null => false
    t.text     "content",                           :null => false
    t.string   "message_type",                      :null => false
    t.text     "full_message",                      :null => false
    t.boolean  "parsed",         :default => false
    t.boolean  "is_transaction", :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "message_id",    :null => false
    t.integer  "from_user",     :null => false
    t.integer  "to_user",       :null => false
    t.string   "status",        :null => false
    t.decimal  "amount_in_btc", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "handle"
    t.decimal  "balance"
    t.string   "btc_address"
    t.boolean  "confirmed"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
