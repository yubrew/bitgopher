class Message < ActiveRecord::Base
  attr_accessible :content, :message_id, :sender, :sender_id

  def self.pull_messages_from_twitter
    Twitter.direct_messages(since_id: maximum(:message_id)).each do |dm|
      unless exists?(message_id: dm.id)
        create!(
          message_id: dm.id,
          content: dm.text,
          sender: dm.sender.name,
          sender_id: dm.sender.id
        )
      end
    end
  end
end
