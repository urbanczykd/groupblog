# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog_author do
    user_id 1
    blog_id 1
    role_id 1
  end
end
