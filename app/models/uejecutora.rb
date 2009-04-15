class Uejecutora < ActiveRecord::Base
  belongs_to :account
  belongs_to :persona
  belongs_to :departamento
end
