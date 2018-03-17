require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Comment" do

    it "should be created" do
      comment_count = Comment.count
      create(:comment)
      expect(Comment.count).to eq(comment_count + 1)
    end

    it "should not be created if description.length = 0" do
      comment_count = Comment.count
      expect {
        create(:comment, content: " ")
      }.to raise_error(ActiveRecord::RecordInvalid)
      expect(Comment.count).to eq(comment_count)
    end
  end
end
