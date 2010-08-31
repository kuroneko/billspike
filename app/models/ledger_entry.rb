class LedgerEntry < ActiveRecord::Base
  belongs_to :account
  belongs_to :entry
  
  validates_associated :account
  validates_associated :entry
  validates_presence_of :amount, :message => "can't be blank"
end
