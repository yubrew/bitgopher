class User < ActiveRecord::Base
  attr_accessible :balance, :btc_address, :confirmed, :handle, :messaging_id
  validates :balance, :btc_address, :confirmed, :handle, :messaging_id, presence: true

  def pending_sent_transactions
  end

  def available_balance
    self.balance - pending_sent_transactions
  end
end
