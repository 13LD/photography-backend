require "rails_helper"

RSpec.describe Api::PostsController, type: :routing do
  describe "routing" do

    it { should route(:get, '/api/posts').to(action: :index) }

    it { should route(:get, '/api/posts/1').to(action: :show, id: 1) }

    it { should route(:post, '/api/posts').to(action: :create) }

    it { should route(:put, '/api/posts/1').to(action: :update, id: 1) }

    it { should route(:patch, '/api/posts/1').to(action: :update, id: 1) }

    it { should route(:delete, '/api/posts/1').to(action: :destroy, id: 1) }

  end
end
