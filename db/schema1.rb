# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090305055452) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.decimal  "balance",      :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "balance_crub", :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "balance_nqn",  :precision => 8, :scale => 2, :default => 0.0
    t.integer  "parent_id"
    t.string   "code",                                                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["code"], :name => "index_accounts_on_code", :unique => true
  add_index "accounts", ["parent_id"], :name => "index_accounts_on_parent_id"

  create_table "departamentos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctipos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personas", :force => true do |t|
    t.string   "name"
    t.string   "apellido"
    t.string   "direccion"
    t.string   "email"
    t.string   "telefono"
    t.string   "identificacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.decimal  "value",      :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "value_crub", :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "value_nqn",  :precision => 8, :scale => 2, :default => 0.0
    t.integer  "doctipo_id"
    t.string   "numero"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["from_id"], :name => "index_transactions_on_from_id"
  add_index "transactions", ["to_id"], :name => "index_transactions_on_to_id"

  create_table "uejecutoras", :force => true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.text     "descripcion"
    t.integer  "persona_id"
    t.integer  "departamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "admin"
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
