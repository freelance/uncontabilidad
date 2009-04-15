class Saldo < ActiveRecord::Base
  belongs_to :cuenta
  belongs_to :tercero
end
