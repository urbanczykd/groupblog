require 'spec_helper'

describe Invitation do
  before do
    @invitation = Invitation.new
  end
  context "#create_prototype_user" do
    it "should create user" do
      @users_count = User.all.count
      @invitation.create_prototype_user("email@gmail.com")
      User.all.count.should == @users_count+1
    end
  end

  context "#generate_valid_password" do
    it "should return valid passowrd" do
      @invitation.generate_valid_password.length == 40
    end
  end
end
