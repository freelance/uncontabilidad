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

ActiveRecord::Schema.define(:version => 20090309180508) do

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

  create_table "acientos", :force => true do |t|
    t.integer  "comprobante_id"
    t.integer  "tipo_doc_aux_id"
    t.integer  "tercero_id"
    t.datetime "fecha"
    t.integer  "cuenta_id"
    t.decimal  "debe",            :precision => 14, :scale => 4
    t.decimal  "haber",           :precision => 14, :scale => 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "cargos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "cargos", ["nombre"], :name => "ck_cargos", :unique => true

  create_table "ciudades", :force => true do |t|
    t.integer  "departamento_id",                :null => false
    t.string   "nombre",          :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "ciudades", ["departamento_id", "nombre"], :name => "ck_ciudades", :unique => true

  create_table "comprobantes", :force => true do |t|
    t.integer  "tipo_contadocumento_id"
    t.datetime "fecha"
    t.integer  "numdocumento"
    t.string   "detalle"
    t.integer  "user_id"
    t.integer  "tercero_id"
    t.string   "observacion"
    t.integer  "sucursal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "comprobantes", ["tipo_contadocumento_id", "numdocumento"], :name => "ck_comprobantes", :unique => true

  create_table "contactos", :force => true do |t|
    t.integer  "tercero_id"
    t.integer  "contacto_id"
    t.integer  "cargo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "cuentas", :force => true do |t|
    t.string   "cuenta"
    t.string   "nombre"
    t.string   "descripcion",      :limit => 200
    t.boolean  "requiere_tercero",                :default => false
    t.integer  "tipo_cuenta_id"
    t.string   "de_detalle",       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "cuentas", ["cuenta"], :name => "ck_cuentas", :unique => true
  add_index "cuentas", ["nombre"], :name => "ck_cuentas2", :unique => true

  create_table "departamentos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pais_id",    :null => false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "departamentos", ["nombre", "pais_id"], :name => "ck_departamentos", :unique => true

  create_table "detalle_facturas", :force => true do |t|
    t.integer  "factura_id"
    t.integer  "producto_id"
    t.integer  "cantidad",                                   :default => 1
    t.string   "description"
    t.decimal  "precio",      :precision => 14, :scale => 2
    t.decimal  "subtotal",    :precision => 14, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "doctipos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facturas", :force => true do |t|
    t.integer  "tipo_factudocumento_id"
    t.integer  "tercero_id"
    t.integer  "sucursal"
    t.date     "fecha"
    t.integer  "numero"
    t.string   "direccion_envio"
    t.decimal  "por_impuesto",           :precision => 14, :scale => 2, :default => 16.0
    t.decimal  "por_descuento",          :precision => 14, :scale => 2, :default => 0.0
    t.decimal  "subtotal",               :precision => 14, :scale => 2
    t.decimal  "total_venta",            :precision => 14, :scale => 2
    t.decimal  "impuesto",               :precision => 14, :scale => 2
    t.decimal  "descuento",              :precision => 14, :scale => 2
    t.decimal  "efectivo",               :precision => 14, :scale => 2
    t.decimal  "saldo",                  :precision => 14, :scale => 2
    t.date     "fecha_vencimiento"
    t.integer  "forma_pago_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "forma_pagos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "forma_pagos", ["nombre"], :name => "ck_forma_pagos", :unique => true

  create_table "paises", :force => true do |t|
    t.string   "cod_pais",   :limit => 2, :null => false
    t.string   "string",     :limit => 2, :null => false
    t.string   "nombre",                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "paises", ["cod_pais"], :name => "ck_paises_01", :unique => true
  add_index "paises", ["nombre"], :name => "ck_paises_02", :unique => true

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

  create_table "productos", :force => true do |t|
    t.integer  "proveedor_id",                                     :null => false
    t.integer  "tipos_producto_id",                                :null => false
    t.string   "nombre",                                           :null => false
    t.string   "descripcion"
    t.decimal  "costo",             :precision => 14, :scale => 3
    t.decimal  "pordes",            :precision => 5,  :scale => 2
    t.decimal  "valor",             :precision => 14, :scale => 3, :null => false
    t.integer  "cantidad"
    t.integer  "minimo"
    t.integer  "cuenta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "productos", ["proveedor_id", "nombre"], :name => "ck_productos", :unique => true

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "saldos", :force => true do |t|
    t.integer  "cuenta_id"
    t.integer  "tercero_id"
    t.string   "documento"
    t.date     "fecha"
    t.decimal  "saldo_ini",  :precision => 14, :scale => 2
    t.decimal  "saldo_fin",  :precision => 14, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "sessiones", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessiones", ["session_id"], :name => "index_sessiones_on_session_id"
  add_index "sessiones", ["updated_at"], :name => "index_sessiones_on_updated_at"

  create_table "ter_categorias", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "ter_categorias", ["nombre"], :name => "ck_ter_categorias", :unique => true

  create_table "terceros", :force => true do |t|
    t.string   "nuid",                               :null => false
    t.integer  "tipo_iddocumento_id",                :null => false
    t.integer  "sucursal"
    t.integer  "tipo_tercero_id",                    :null => false
    t.integer  "ter_categoria_id",                   :null => false
    t.string   "razsoc",              :limit => 150
    t.string   "prinom"
    t.string   "segnom"
    t.string   "priape"
    t.string   "segape"
    t.string   "direccion"
    t.string   "telefono1"
    t.string   "ext1"
    t.string   "telefono2"
    t.string   "ext3"
    t.string   "fax"
    t.string   "celular"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "terceros", ["nuid", "tipo_iddocumento_id", "sucursal"], :name => "ck_terceros", :unique => true

  create_table "tipo_contadocumentos", :force => true do |t|
    t.string   "codigo",        :limit => 10
    t.string   "nombre",                      :null => false
    t.string   "reporte"
    t.integer  "numero"
    t.integer  "numero_maximo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "tipo_contadocumentos", ["codigo"], :name => "ck_tipo_contadocumentos2", :unique => true
  add_index "tipo_contadocumentos", ["nombre"], :name => "ck_tipo_contadocumentos", :unique => true

  create_table "tipo_cuentas", :force => true do |t|
    t.string   "nombre",     :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "tipo_cuentas", ["nombre"], :name => "ck_tipo_cuentas", :unique => true

  create_table "tipo_doc_aux", :force => true do |t|
    t.string   "nombre",                  :null => false
    t.string   "abreviado",  :limit => 3, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "tipo_doc_aux", ["abreviado"], :name => "ck_tipo_doc_aux2", :unique => true
  add_index "tipo_doc_aux", ["nombre"], :name => "ck_tipo_doc_aux", :unique => true

  create_table "tipo_factudocumentos", :force => true do |t|
    t.string   "codigo",        :limit => 10
    t.string   "nombre",                      :null => false
    t.integer  "numero"
    t.integer  "numero_minimo"
    t.integer  "numero_maximo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "tipo_factudocumentos", ["codigo"], :name => "ck_tipo_factudocumentos2", :unique => true
  add_index "tipo_factudocumentos", ["nombre"], :name => "ck_tipo_factudocumentos", :unique => true

  create_table "tipo_iddocumentos", :force => true do |t|
    t.string   "nombre",       :limit => 100
    t.string   "nombre_corto", :limit => 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "tipo_iddocumentos", ["nombre"], :name => "ck_tipo_iddocumentos", :unique => true

  create_table "tipo_terceros", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "tipo_terceros", ["nombre"], :name => "ck_tipo_terceros", :unique => true

  create_table "tipos_productos", :force => true do |t|
    t.string   "nombre",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "tipos_productos", ["nombre"], :name => "ck_tipos_productos", :unique => true

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
