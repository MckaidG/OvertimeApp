require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Creation" do
    before do
      @user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", first_name: "Ron", last_name: "Swanson")
    end
    it "can be created" do
      expect(@user).to be_valid
    end
    it "cannont be created without first_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
