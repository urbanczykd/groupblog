# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    owner_id 1
    title "MyString"
    body "MyText"
  end
end
