require 'rails_helper'

RSpec.describe ServiceItem, type: :model do
  it { should validate_presence_of(:description) }

  it { should belong_to(:service) }
end
