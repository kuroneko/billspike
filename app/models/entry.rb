class Entry < ActiveRecord::Base
  has_many :ledger_entries
  
  def creditor_total
    0
  end
  
  def debtor_total
    0
  end
end
