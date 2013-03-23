  # Before do
  #   #killing the table data as we aren't using fixtures
  #   User.destroy_all
  #   Role.destroy_all
  #   UserRole.destroy_all
  #   user = Factory.build(:user)
  #   role = Factory.build(:role)
  #   user_role = Factory.create(:user_role)
  # end



FactoryGirl.define do
  factory :user_role do
    association :user
    association :role
  end

end