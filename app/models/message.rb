class Message < ActiveRecord::Base
  attr_accessible :content, :full_message, :message_id, :parsed, :sender, :sender_id, :type

  scope :dms, where(type: 'dm')
  scope :tweets, where(type: 'tweet')

  def self.pull_messages_from_twitter
    Twitter.direct_messages(since_id: Message.dms.maximum(:message_id)).each do |dm|
      unless exists?(message_id: dm.id.to_s)
        create!(
          message_id: dm.id.to_s,
          content: dm.text,
          sender: dm.sender.name,
          sender_id: dm.sender.id.to_s,
          type: 'dm',
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
          type: 'tweet',
          full_message: tweet
        )
      end
    end
  end

end
