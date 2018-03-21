require "rails_helper"

RSpec.describe Api::CommentsController, type: :routing do
  describe "routing" do

    it { should route(:get, '/api/comments').to(action: :index) }

    it { should route(:get, '/api/comments/1').to(action: :show, id: 1) }

    it { should route(:post, '/api/comments').to(action: :create) }

    it { should route(:put, '/api/comments/1').to(action: :update, id: 1) }

    it { should route(:patch, '/api/comments/1').to(action: :update, id: 1) }

    it { should route(:delete, '/api/comments/1').to(action: :destroy, id: 1) }

  end
end
