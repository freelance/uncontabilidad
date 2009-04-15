class CreateUejecutoras < ActiveRecord::Migration
  def self.up
    create_table :uejecutoras do |t|
      t.string :name
      t.references :account
      t.text :descripcion
      t.references :persona
      t.references :departamento

      t.timestamps
    end
  end

  def self.down
    drop_table :uejecutoras
  end
end
