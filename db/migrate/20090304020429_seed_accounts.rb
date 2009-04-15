class SeedAccounts < ActiveRecord::Migration
  def self.up
    [
      { :code => '1', :name => 'ACTIVO' },
      { :code => '2', :name => 'PASIVO' },
      { :code => '3', :name => 'PATRIM. NETO' },
      { :code => '4', :name => 'RESULTADOS' },
      { :code => '5', :name => 'CTAS. DE ORDEN' }
    ].each {|r|
      Account.create(r)
    }

    p1 = Account.find_by_code('1')
    [
      { :name => 'ACTIVO CORRIENTE' },
      { :name => 'ACTIVO NO CORRIENTE' },
    ].each {|r|
      p1.children.create(r)
    }

    p2 = Account.find_by_code('2')
    [
      { :name => 'PASIVO CORRIENTE' },
      { :name => 'PASIVO NO CORRIENTE' }
    ].each {|r|
      p2.children.create(r)
    }

    p11 = Account.find_by_code('1.1')
    [
      { :name => 'CAJA Y BANCOS' },
      { :name => 'INVERSIONES CORRIENTES' },
      { :name => 'CREDITOS' },
      { :name => 'BIENES DE CAMBIO' }
    ].each {|r|
      p11.children.create(r)
    }

    p111 = Account.find_by_code('1.1.1')
    [
      { :name => 'CAJA' },
      { :name => 'BANCOS EN MONEDA NACIONAL' },
      { :name => 'BANCOS EN MONEDA EXTRANJERA' }
    ].each {|r|
      p111.children.create(r)
    }

    #p1111 = Account.find_by_code('1.1.1.1')
    #[
      #{ :name => 'CAJA EN MONEDA NACIONAL' },
      #{ :name => 'FONDO FIJO' },
      #{ :name => 'CAJA EN MONEDA EXTRANJERA' }
    #].each {|r|
      #p1111.children.create(r)
    #}

  end

  def self.down
    Account.delete_all
  end
end

