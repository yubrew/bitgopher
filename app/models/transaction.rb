class Transaction < ActiveRecord::Base
  attr_accessible :amount_in_btc, :from_user_handle, :message_id, :status, :to_user_handle

  validates :amount_in_btc, :from_user_handle, :message_id, :status, :to_user_handle, presence: :true
  before_validation :check_positive_balance, :check_to_user_exists

  def from_user
    User.find(handle: self.from_user_handle)
  end

  def to_user
    User.find(handle: self.to_user_handle)
  end

  def check_positive_balance
    self.from_user.available_balance > amount_in_btc
  end
end
