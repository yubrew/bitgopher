class Transaction < ActiveRecord::Base
  attr_accessible :amount_in_btc, :from_user, :message_id, :status, :to_user
  belongs_to :message
  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'
  validates :amount_in_btc, :from_user, :message_id, :status, :to_user, presence: true
  before_validation :check_for_positive_balance

  private
  def check_for_positive_balance
    self.from_user.available_balance - self.amount_in_btc >= 0.0
  end
end
