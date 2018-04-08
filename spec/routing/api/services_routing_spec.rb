require "rails_helper"

RSpec.describe Api::ServicesController, type: :routing do
  describe "routing" do

    it { should route(:get, '/api/services').to(action: :index) }

    it { should route(:get, '/api/services/1').to(action: :show, id: 1) }

    it { should route(:post, '/api/services').to(action: :create) }

    it { should route(:put, '/api/services/1').to(action: :update, id: 1) }

    it { should route(:patch, '/api/services/1').to(action: :update, id: 1) }

    it { should route(:delete, '/api/services/1').to(action: :destroy, id: 1) }

  end
end
