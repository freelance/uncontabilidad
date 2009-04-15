class Factura < ActiveRecord::Base
  belongs_to :tipo_factudocumento
  belongs_to :tercero
  belongs_to :forma_pago
  has_many :detalle_facturas
end