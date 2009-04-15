class CreatePersonas < ActiveRecord::Migration
  def self.up
    create_table :personas do |t|
      t.string :name
      t.string :apellido
      t.string :direccion
      t.string :email
      t.string :telefono
      t.string :identificacion

      t.timestamps
    end
  end

  def self.down
    drop_table :personas
  end
end
