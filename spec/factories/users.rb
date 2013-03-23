
FactoryGirl.define do
  factory :user do
    # association :user_roles, :factory => :user_roles
    # association :role, :factory => :role
    email{ Faker::Internet.email }
    password 'password'
    password_confirmation { |x| x.password }
    roles{|roles| [roles.association(:role)]}
      # after_create do |u|
      #   Factory(:role, :name => "User", :user => u)
      # end
  end
end
#   # factory :admin, :parent => :user do
#   #   after_create do |u|
#   #     if u.roles.empty?
#   #       Factory(:role, :name => 'Admin', :user => u)
#   #     end
#   #   end
#   # end

# end