class Departamento < ActiveRecord::Base
  belongs_to :pais
  has_many :ciudades
  def to_s
    self.nombre
  end
end
