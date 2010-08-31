class Entry < ActiveRecord::Base
  has_many :ledger_entries
  
  def credits_total
    self.ledger_entries.where('amount > 0').sum(:amount)
  end
  
  def debits_total
    self.ledger_entries.where('amount < 0').sum(:amount)
  end
  
  def balance
    self.ledger_entries.sum(:amount)
  end
end
