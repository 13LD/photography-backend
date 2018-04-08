require "rails_helper"

RSpec.describe Api::ServiceItemsController, type: :routing do
  describe "routing" do

    it { should route(:get, '/api/service_items').to(action: :index) }

    it { should route(:get, '/api/service_items/1').to(action: :show, id: 1) }

    it { should route(:post, '/api/service_items').to(action: :create) }

    it { should route(:put, '/api/service_items/1').to(action: :update, id: 1) }

    it { should route(:patch, '/api/service_items/1').to(action: :update, id: 1) }

    it { should route(:delete, '/api/service_items/1').to(action: :destroy, id: 1) }

  end
end
