require 'spec_helper'

describe User do

  describe "password validations" do

    it "should require a password" do
      user = FactoryGirl.build(:user, {password: "hi"})
      user.should_not be_valid
    end
  end
end
