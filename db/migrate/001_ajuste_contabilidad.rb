class AjusteContabilidad < ActiveRecord::Migration
  def self.up
    create_table :tipo_iddocumentos, :force => true do |t|
      t.string :nombre, :limit => 100
      t.string :nombre_corto, :limit => 3
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :tipo_iddocumentos, [:nombre], :name => "ck_tipo_iddocumentos", :unique => true
    #***************************************
    create_table :ter_categorias, :force => true do |t|
      t.string :nombre
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :ter_categorias, [:nombre], :name => "ck_ter_categorias", :unique => true
    #***************************************
    create_table :tipo_terceros, :force => true do |t|
      t.string :nombre
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :tipo_terceros, [:nombre], :name => "ck_tipo_terceros", :unique => true
    #***************************************
    create_table :terceros, :force => true do |t|
      t.string :nuid, :null => false
      t.belongs_to :tipo_iddocumento,:null => false
      t.integer :sucursal
      t.belongs_to :tipo_tercero,:null => false
      t.belongs_to :ter_categoria,:null => false
      t.string :razsoc, :limit => 150
      t.string :prinom
      t.string :segnom
      t.string :priape
      t.string :segape
      t.string :direccion
      t.string :telefono1
      t.string :ext1
      t.string :telefono2
      t.string :ext3
      t.string :fax
      t.string :celular
      t.string :email
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :terceros, [:nuid,:tipo_iddocumento_id,:sucursal], :name => "ck_terceros", :unique => true
    #***************************************
    create_table :tipos_productos, :force => true do |t|
      t.string :nombre,:null => false
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :tipos_productos, [:nombre], :name => "ck_tipos_productos", :unique => true
    #***************************************
    create_table :productos, :force => true do |t|
      t.belongs_to :proveedor,:null => false    #de terceros del tipo proveedor
      t.belongs_to :tipos_producto,:null => false
      t.string :nombre, :null => false
      t.string :descripcion
      t.decimal :costo, :precision => 14, :scale => 3
      t.decimal :pordes, :precision => 5, :scale => 2
      t.decimal :valor, :precision => 14, :scale => 3, :null => false
      t.integer :cantidad
      t.integer :minimo
      t.belongs_to :cuenta    #cuenta del plan en la que debe de registrarse cualquier operacion de compra o venta del producto
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :productos, [:proveedor_id,:nombre], :name => "ck_productos", :unique => true
    #***************************************
    create_table :tipo_doc_aux, :force => true do |t|
      t.string :nombre,    :null => false
      t.string :abreviado, :limit => 3,    :null => false
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :tipo_doc_aux, [:nombre], :name => "ck_tipo_doc_aux", :unique => true
    add_index :tipo_doc_aux, [:abreviado], :name => "ck_tipo_doc_aux2", :unique => true
    #***************************************
    create_table :tipo_cuentas, :force => true do |t|
      t.string :nombre, :limit => 100
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :tipo_cuentas, [:nombre], :name => "ck_tipo_cuentas", :unique => true
    #***************************************
    create_table :cuentas, :force => true do |t|
      t.string :cuenta
      t.string :nombre
      t.string :descripcion, :limit => 200
      t.boolean :requiere_tercero
      t.belongs_to :tipo_cuenta, :null => true
      t.string :de_detalle, :limit => 1
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :cuentas, [:cuenta], :name => "ck_cuentas", :unique => true
    add_index :cuentas, [:nombre], :name => "ck_cuentas2", :unique => true
    #***************************************
    create_table :tipo_contadocumentos, :force => true do |t|
      t.string :codigo, :limit => 10
      t.string :nombre, :null => false
      t.string :reporte
      t.integer :numero
      t.integer :numero_maximo
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :tipo_contadocumentos, [:nombre], :name => "ck_tipo_contadocumentos", :unique => true
    add_index :tipo_contadocumentos, [:codigo], :name => "ck_tipo_contadocumentos2", :unique => true
    #***************************************
    create_table :comprobantes, :force => true do |t|
      t.belongs_to :tipo_contadocumento
      t.datetime :fecha
      t.integer :numdocumento
      t.string :detalle
      t.belongs_to :user
      t.belongs_to :tercero
      t.string :observacion
      t.integer :sucursal
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :comprobantes, [:tipo_contadocumento_id, :numdocumento], :name => "ck_comprobantes", :unique => true
    #***************************************
    create_table :acientos, :force => true do |t|
      t.belongs_to :comprobante
      t.belongs_to :tipo_doc_aux
      t.belongs_to :tercero
      t.datetime :fecha
      t.belongs_to :cuenta
      t.decimal :debe,  :precision => 14, :scale => 4
      t.decimal :haber,  :precision => 14, :scale => 4
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    #***************************************
    create_table :cargos, :force => true do |t|
      t.string :nombre
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :cargos, [:nombre], :name => "ck_cargos", :unique => true
    #***************************************
    create_table :contactos, :force => true do |t|
      t.belongs_to :tercero
      t.belongs_to :contacto
      t.belongs_to :cargo
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    #***************************************
    create_table :saldos, :force => true do |t|
      t.belongs_to :cuenta
      t.belongs_to :tercero
      t.string :documento
      t.date :fecha
      t.decimal :saldo_ini, :precision => 14, :scale => 2
      t.decimal :saldo_fin, :precision => 14, :scale => 2
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    #***************************************
    create_table :paises, :force => true do |t|
      t.string :cod_pais,   :string,   :limit => 2, :null => false
      t.string :nombre, :null => false
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :paises, [:cod_pais], :name => "ck_paises_01", :unique => true
    add_index :paises, [:nombre], :name => "ck_paises_02", :unique => true
    #***************************************
    change_table :departamentos do |t|
      t.belongs_to :pais, :null => false
      #t.string :nombre, :limit => 100
      #t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :departamentos, [:pais_id,:nombre], :name => "ck_departamentos", :unique => true
    #***************************************
    create_table :ciudades, :force => true do |t|
      t.belongs_to :departamento, :null => false
      t.string :nombre, :limit => 100
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :ciudades, [:departamento_id,:nombre], :name => "ck_ciudades", :unique => true
    #***************************************
    create_table :tipo_factudocumentos, :force => true do |t|
      t.string :codigo, :limit => 10
      t.string :nombre, :null => false
      t.integer :numero
      t.integer :numero_minimo
      t.integer :numero_maximo
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :tipo_factudocumentos, [:nombre], :name => "ck_tipo_factudocumentos", :unique => true
    add_index :tipo_factudocumentos, [:codigo], :name => "ck_tipo_factudocumentos2", :unique => true
    #***************************************
    create_table :forma_pagos, :force => true do |t|
      t.string :nombre
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    add_index :forma_pagos, [:nombre], :name => "ck_forma_pagos", :unique => true
    #***************************************
    create_table :facturas do |t|
      t.references :tipo_factudocumento
      t.references :tercero
      t.integer :sucursal
      t.date :fecha
      t.integer :numero
      t.string :direccion_envio
      t.decimal :por_impuesto, :precision => 14, :scale => 2, :default => 16.0
      t.decimal :por_descuento, :precision => 14, :scale => 2, :default => 0.0
      t.decimal :subtotal, :precision => 14, :scale => 2
      t.decimal :total_venta, :precision => 14, :scale => 2
      t.decimal :impuesto, :precision => 14, :scale => 2
      t.decimal :descuento, :precision => 14, :scale => 2
      t.decimal :efectivo, :precision => 14, :scale => 2
      t.decimal :saldo, :precision => 14, :scale => 2
      t.date :fecha_vencimiento
      t.belongs_to :forma_pago
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
    #***************************************
    create_table :detalle_facturas do |t|
      t.references :factura
      t.references :producto
      t.integer :cantidad, :default => 1
      t.string :description
      t.decimal :precio, :precision => 14, :scale => 2
      t.decimal :subtotal, :precision => 14, :scale => 2
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
    end
  end
  def self.down
  end
end
