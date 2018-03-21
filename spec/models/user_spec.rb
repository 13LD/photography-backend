require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User" do

    it { should allow_value('d.lysohor@gmail.com').for(:email) }

    it { should_not allow_value('d.lysohor@com').for(:email) }

    it { should have_secure_password }

    it { should validate_presence_of :name }

  end
end
