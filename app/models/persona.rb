class Persona < ActiveRecord::Base
  def to_s
    "#{self.apellido}, #{self.name}"
  end
end
