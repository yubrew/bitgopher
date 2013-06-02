# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    message_id 1
    from_user 1
    to_user 1
    status "MyString"
    amount_in_btc "9.99"
  end
end
