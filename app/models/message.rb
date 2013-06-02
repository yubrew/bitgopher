class Message < ActiveRecord::Base
  attr_accessible :content, :full_message, :is_transaction, :message_id, :message_type, :parsed, :sender, :sender_id

  scope :twitter_dms, where(type: 'twitter_dm')
  scope :twitter_tweets, where(type: 'twitter_tweet')

  def self.pull_messages_from_twitter
    Twitter.direct_messages(since_id: Message.dms.maximum(:message_id)).each do |dm|
      unless exists?(message_id: dm.id.to_s)
        create!(
          message_id: dm.id.to_s,
          content: dm.text,
          sender: dm.sender.name,
          sender_id: dm.sender.id.to_s,
          type: 'twitter_dm',
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
          sender_id: tweet.user.id.to_s,
          type: 'twitter_tweet',
          full_message: tweet
        )
      end
    end
  end

end
