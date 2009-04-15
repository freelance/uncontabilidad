class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.decimal :balance, :precision => 8, :scale => 2, :default => 0
      t.decimal :balance_crub, :precision => 8, :scale => 2, :default => 0
      t.decimal :balance_nqn, :precision => 8, :scale => 2, :default => 0
      t.integer :parent_id
      t.string :code, :null => false

      t.timestamps
    end

    add_index :accounts, :code, :unique => true
    add_index :accounts, :parent_id
  end

  def self.down
    drop_table :accounts
  end
end
