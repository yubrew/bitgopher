class Message < ActiveRecord::Base
  attr_accessible :content, :full_message, :is_transaction, :message_id, :message_type, :parsed, :sender
  validates :content, :full_message, :message_id, :message_type, :sender, presence: true
  validates :message_id, uniqueness: true
  before_validation :squeeze_whitespace

  scope :twitter_dms, where(type: 'twitter_dm')
  scope :twitter_tweets, where(type: 'twitter_tweet')

  def self.pull_messages_from_twitter
    Twitter.direct_messages(since_id: Message.dms.maximum(:message_id)).each do |dm|
      unless exists?(message_id: dm.id.to_s)
        create!(
          message_id: dm.id.to_s,
          content: dm.text,
          sender: dm.sender.name,
          message_type: 'twitter_dm',
          full_message: dm
        )
      end
    end
  end

  def self.pull_tweets
    Twitter.home_timeline(since_id: (Message.tweets.maximum(:message_id) || 1)).each do |tweet|
      unless exists?(message_id: tweet.id.to_s)
        create!(
          message_id: tweet.id.to_s,
          content: tweet.text,
          sender: tweet.user.name,
          message_type: 'twitter_tweet',
          full_message: tweet
        )
      end
    end
  end

  def parse
    #check if sender is a valid user
    if User.where(handle: self.sender).first
      if self.message_type == 'twitter_dm' && ['GETACCOUNTINFO'].include?(self.content)
        #create info request
        self.is_transaction = true
        self.save
      else

        #check transaction
        if self.message_type == 'twitter_tweet' && self.content =~ /\+tip @(\w+) (\d\.*\d*) btc/
          to_user_handle = $1
          bitcoin_amount = $2

          t = Transaction.new(amount_in_btc: BigDecimal.new(bitcoin_amount))
          t.from_user_id = User.find_by_handle(sender).try(:id)
          t.to_user_id = User.find_by_handle(to_user_handle).try(:id)
          t.message_id = self.id
          t.status = 'pending'

          if t.save
            self.is_transaction = true
            self.save
          end

        end

        #check bitcoin_transaction
        if self.message_type == 'twitter_dm' && ['DEPOSIT','WITHDRAW'].include?(self.content)

          #bitcoin_transaction = BitcoinTransaction.new
          #if bitcoin_transaction.save
          #self.is_transaction = true
          #self.save
        end

      end

    end

    self.parsed = true
  end

  def remove_old_non_transaction_messages
  end

  private
  def squeeze_whitespace
    self.content.squeeze!(' ')

  end
end
