class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :from_id
      t.integer :to_id
      t.decimal :value, :precision => 8, :scale => 2, :default => 0
      t.decimal :value_crub, :precision => 8, :scale => 2, :default => 0
      t.decimal :value_nqn, :precision => 8, :scale => 2, :default => 0
      t.references :doctipo
      t.string :numero
      t.timestamps
    end

    add_index :transactions, :from_id
    add_index :transactions, :to_id
  end

  def self.down
    drop_table :transactions
  end
end
