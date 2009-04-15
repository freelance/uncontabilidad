class FormaPago < ActiveRecord::Base
  has_many :facturas
end
