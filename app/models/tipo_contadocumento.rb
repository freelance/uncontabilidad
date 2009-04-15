class TipoContadocumento < ActiveRecord::Base
  has_many :comprobantes
end
