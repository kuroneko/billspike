class CreateLedgerEntries < ActiveRecord::Migration
  def self.up
    create_table :ledger_entries do |t|
      t.integer :account_id, :null => false
      t.integer :entry_id, :null => false
      t.decimal :amount, :null => false, :default => 0, :scale => 2
      t.timestamps
    end
    add_index :ledger_entries, [:account_id, :entry_id], :unique => true
  end

  def self.down
    drop_table :ledger_entries
  end
end
