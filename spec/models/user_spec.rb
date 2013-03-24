require 'spec_helper'

describe User do

  before do
    User.all.destroy
    user = FactoryGirl.create(:user)
    
    #user.roles << FactoryGirl.create(:role)
  end

  context 'method is?' do
    it "return user role" do
      puts user.to_json
      #puts user.is?("Admin")
     # puts user.to_json
      #user.is?("Admin").shoult be_true
    end
  end

end
