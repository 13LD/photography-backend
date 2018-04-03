require "rails_helper"

RSpec.describe Api::TagsController, type: :routing do
  describe "routing" do

    it { should route(:get, '/api/tags').to(action: :index) }

    it { should route(:get, '/api/tags/1').to(action: :show, id: 1) }

    it { should route(:post, '/api/tags').to(action: :create) }

    it { should route(:put, '/api/tags/1').to(action: :update, id: 1) }

    it { should route(:patch, '/api/tags/1').to(action: :update, id: 1) }

    it { should route(:delete, '/api/tags/1').to(action: :destroy, id: 1) }


  end
end
