class Entry < ActiveRecord::Base
  has_many :ledger_entries, :dependent => :delete_all
  
  accepts_nested_attributes_for :ledger_entries, :allow_destroy => true, :reject_if => proc { |obj|
    obj.blank? or obj['account_id'].nil? or obj['account_id'].blank? or obj['amount'].nil? or obj['amount'].to_f == 0.0
  }
  
  def parties
    self.ledger_entries.map { |le| le.account }
  end
  
  def credits_total
    self.ledger_entries.where('amount > 0').sum(:amount)
  end
  
  def debits_total
    self.ledger_entries.where('amount < 0').sum(:amount)
  end
  
  def balance(for_account = nil)
    if for_account then
      le = self.ledger_entries.where(:account_id => for_account.id).first
      if le then
        le.amount
      else
        0
      end
    else
      self.ledger_entries.sum(:amount)
    end
  end
end
