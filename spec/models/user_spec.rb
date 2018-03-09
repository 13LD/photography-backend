require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User" do

    it "should be created" do
      user_count = User.count
      create(:user)
      expect(User.count).to eq(user_count + 1)
    end

    it "should not be created if name.length = 0" do
      user_count = User.count
      expect {
        create(:user, name: " ")
      }.to raise_error(ActiveRecord::RecordInvalid)
      expect(User.count).to eq(user_count)
    end

  end
end
