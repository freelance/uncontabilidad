class Tercero < ActiveRecord::Base
  belongs_to :tipo_iddocumento
  belongs_to :tipo_tercero
  belongs_to :ter_categoria
  has_many :productos,:foreign_key => 'proveedor_id'
  has_many :comprobantes
  has_many :acientos
  has_many :contactos
  has_many :cliente,:class_name => 'Contacto',:foreign_key => 'contacto_id'
  has_many :saldos
  has_many :facturas
  def to_label
    prinom1 = prinom || ''
    segnom1 = segnom || ''
    priape1 = priape || ''
    segape1 = segape || ''
    nuid + ' - ' + prinom1  + ' ' + segnom1 + ' ' + priape1  + ' ' + segape1
  end
end
