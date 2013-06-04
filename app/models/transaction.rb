class Transaction < ActiveRecord::Base
  belongs_to :message
  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'
  attr_accessible :amount_in_btc, :status
  validates :amount_in_btc, :status, :message_id, :from_user_id, presence: true
  before_validation :check_from_user_exists#, :check_duplicate_transaction, :check_for_positive_balance

  private
  def check_from_user_exists
    if self.from_user.blank?
      errors.add(:sender, 'does not exist')
    end
  end

  def check_duplicate_transaction
    t = Transaction.where(from_user: :from_user_id, message: :message_id)
    t.blank?
  end

  def check_for_positive_balance
    self.from_user.available_balance - self.amount_in_btc >= 0.0
  end

end
