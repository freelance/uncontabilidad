class Aciento < ActiveRecord::Base
  belongs_to :comprobante
  belongs_to :tipo_doc_aux
  belongs_to :tercero
  belongs_to :cuenta
end
