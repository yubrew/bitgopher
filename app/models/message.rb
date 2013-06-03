class Message < ActiveRecord::Base
  attr_accessible :content, :full_message, :is_transaction, :message_id, :message_type, :parsed, :sender
  validates :content, :full_message, :message_id, :message_type, :sender, presence: true
  validates :message_id, uniqueness: true

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
    #check if sender / sender_id is a valid user
    if self.message_type == 'twitter_dm' && ['GETACCOUNTINFO','WITHDRAW','ACCEPT'].include?(self.content)
    @sender = User.where(handle: self.sender)
      #create info request
    elsif self.message_type == 'twitter_tweet'
    end

    #check if sender / sender_id is a valid user
    #check if transaction
    #check if bitcoin_transaction
    #transaction = Transaction.new(from_user: from_user, to_user: to_user, message_id: self.id, amount_in_btc: BigDecimal.new(btc))
    #if transaction.save
      #self.is_transaction = true
      #self.save
    #end
    self.parsed = true
  end

  def remove_old_non_transaction_messages
  end
end
