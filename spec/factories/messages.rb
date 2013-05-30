# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    message_id "MyString"
    sender "MyString"
    sender_id "MyString"
    content "MyText"
    type ""
    full_message "MyText"
    parsed false
  end
end
