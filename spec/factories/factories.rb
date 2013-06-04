module FactoryGirlDefaultMethods
  include FactoryGirl::Syntax::Methods
  extend self

  def default_info_message
    default_content = 'GETACCOUNTINFO'
    Message.find_by_content(default_content) || FactoryGirl.create(:message, content: default_content, message_type: 'twitter_dm')
  end

  def default_transaction_message
    default_content = '+tip @yubrew 1 btc'
    Message.find_by_content(default_content) || FactoryGirl.create(:message, :content=>default_content, message_type: 'twitter_tweet')
  end

end
FactoryGirl.define do

  sequence :message_id do |n|
    "message#{n}"
  end

  factory :message do
    message_id { generate :message_id }
    sender "MyString"
    content "MyText"
    message_type "MyString"
    full_message "MyText"
    parsed false
    is_transaction false
  end

  factory :transaction do
    message_id 1
    from_user 1
    to_user 1
    status "MyString"
    amount_in_btc "9.99"
  end

  factory :user do
    handle "MyString"
    balance "9.99"
    btc_address "MyString"
    confirmed false
  end

end
