class Cuenta < ActiveRecord::Base
  belongs_to :tipo_cuenta
  has_many :productos
  has_many :acientos
  has_many :saldos
end
