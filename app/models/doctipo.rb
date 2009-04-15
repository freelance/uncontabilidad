class Doctipo < ActiveRecord::Base
   has_many :transactions
    def to_s
      "#{self.nombre} "
     
  end
end
