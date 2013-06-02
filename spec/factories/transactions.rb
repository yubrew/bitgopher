# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    message_id "MyString"
    from_user_handle "MyString"
    to_user_handle "MyString"
    status "MyString"
    amount_in_btc "MyString"
  end
end
