class Account < ActiveRecord::Base
  has_many :ledger_entries
  validates_presence_of :name, :message => "can't be blank"
  validates_uniqueness_of :name, :message => "must be unique"
  
  def debtor
    !self.creditor
  end
  def debtor=(val)
    self.creditor = !val
  end
  
  def balance
    self.ledger_entries.sum(:amount)
  end
end
