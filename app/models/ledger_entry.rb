class LedgerEntry < ActiveRecord::Base
  belongs_to :account
  belongs_to :entry
  
  validates_associated :account
  validates_associated :entry
  validates_presence_of :amount, :message => "can't be blank"
  validates_numericality_of :amount, :on => :create, :message => "is not a number"
end
