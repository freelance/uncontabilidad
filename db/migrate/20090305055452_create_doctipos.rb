class CreateDoctipos < ActiveRecord::Migration
  def self.up
    create_table :doctipos do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :doctipos
  end
end
