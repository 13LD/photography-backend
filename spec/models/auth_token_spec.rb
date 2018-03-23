require 'rails_helper'

RSpec.describe AuthToken, type: :model do
  it { should validate_presence_of :token }

  it { should belong_to(:user) }
end
