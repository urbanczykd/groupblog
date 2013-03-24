# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    name "MyString"
    slug "MyString"
    author_id 1
  end
end
