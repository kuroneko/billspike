class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name, :null => false
      t.boolean :creditor, :null => false, :default => false
      t.timestamps
    end
    add_index :accounts, :name, :unique => true
  end

  def self.down
    drop_table :accounts
  end
end
