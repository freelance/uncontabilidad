class Producto < ActiveRecord::Base
  belongs_to :proveedor,:class_name => 'Tercero',:foreign_key => 'proveedor_id',
    :conditions => 'tipo_tercero_id > 3'    # 3 Para proveedores
  belongs_to :tipos_producto
  belongs_to :cuenta
  has_many :detalle_facturas
end
