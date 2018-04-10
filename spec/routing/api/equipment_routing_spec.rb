require "rails_helper"

RSpec.describe Api::EquipmentController, type: :routing do
  describe "routing" do

    it { should route(:get, '/api/equipment').to(action: :index) }

    it { should route(:get, '/api/equipment/1').to(action: :show, id: 1) }

    it { should route(:post, '/api/equipment').to(action: :create) }

    it { should route(:put, '/api/equipment/1').to(action: :update, id: 1) }

    it { should route(:patch, '/api/equipment/1').to(action: :update, id: 1) }

    it { should route(:delete, '/api/equipment/1').to(action: :destroy, id: 1) }

  end
end
