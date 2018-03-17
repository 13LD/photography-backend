require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Post" do

    it "should be created" do
      post_count = Post.count
      create(:post)
      expect(Post.count).to eq(post_count + 1)
    end

    it "should not be created if description.length = 0" do
      post_count = Post.count
      expect {
        create(:post, description: " ")
      }.to raise_error(ActiveRecord::RecordInvalid)
      expect(Post.count).to eq(post_count)
    end


  end
end
