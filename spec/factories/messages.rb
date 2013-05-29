# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    message_id "MyString"
    sender_id "MyString"
    sender "MyString"
    content "MyText"
  end
end
