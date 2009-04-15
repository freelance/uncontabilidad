class TipoFactudocumento < ActiveRecord::Base
  has_many :facturas
end
