# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    handle "MyString"
    messaging_id "MyString"
    balance "9.99"
    btc_address "MyString"
    confirmed false
  end
end
