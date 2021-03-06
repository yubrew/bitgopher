class User < ActiveRecord::Base
  attr_accessible :balance, :btc_address, :confirmed, :handle
  validates :balance, :btc_address, :handle, presence: true
  validates :confirmed, inclusion: {in: [true, false], message: 'requires true or false value'}, on: :create
  validates :handle, uniqueness: true
  has_many :transactions
  has_many :bitcoin_transactions
  before_validation :get_bitcoin_address

  def pending_sent_transactions
    self.transactions
  end

  def available_balance
    self.balance - pending_sent_transactions
  end

  private
  def get_bitcoin_address
    new_bitcoin_address =  '19YPrPAQdjwEsT2QnbvhVnyEuyXWxSL2Hq' #add bitcoind implementation to create new address bitcoind.getnewaddress(handle)
    if new_bitcoin_address == 'error'
      nil
    else
      self.btc_address = new_bitcoin_address
    end
  end
end
