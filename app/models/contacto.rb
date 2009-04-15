class Contacto < ActiveRecord::Base
  belongs_to :tercero
  belongs_to :contacto,:class_name => 'Tercero',:foreign_key => 'contacto_id',
    :conditions => 'tipo_tercero_id > 4'    # 4 Para contactos
  belongs_to :cargo
end
