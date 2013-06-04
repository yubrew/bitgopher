FactoryGirl.define do

  sequence :message_id do |n|
    "message#{n}"
  end

  sequence :handle do |n|
    "#{Faker::Internet.user_name}#{n}"
  end

  factory :user do
    handle { generate :handle }
    balance BigDecimal.new('9.99')
    btc_address "MyString"
    confirmed false
  end

  factory :message do |f|
    f.message_id { generate :message_id }
    f.sender { FactoryGirl.create(:user).handle }
    f.content "some message here"
    f.message_type 'tweet_dm'
    f.full_message "MyText"
    f.parsed false
    f.is_transaction false

    factory :info_message do
      message_type 'twitter_dm'
      content 'GETACCOUNTINFO'
    end

    factory :transaction_message do
      message_type 'twitter_tweet'
      content '+tip @user 1 btc'
    end

    factory :bitcoin_transaction_message do
      message_type 'twitter_dm'
      content 'WITHDRAWALL 19YPrPAQdjwEsT2QnbvhVnyEuyXWxSL2Hq'
    end

  end

  factory :transaction do |f|
    f.association :message
    f.association :from_user, factory: :user
    f.association :to_user, factory: :user
    f.status "MyString"
    f.amount_in_btc BigDecimal.new('9.99')
  end

end
