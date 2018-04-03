require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "Tag" do

    it { should validate_presence_of :tag_name }

  end
end
