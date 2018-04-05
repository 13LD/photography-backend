require "rails_helper"

RSpec.describe Api::PhotosController, type: :routing do
  describe "routing" do

    it { should route(:get, '/api/photos').to(action: :index) }

    it { should route(:get, '/api/photos/1').to(action: :show, id: 1) }

    it { should route(:post, '/api/photos').to(action: :create) }

    it { should route(:put, '/api/photos/1').to(action: :update, id: 1) }

    it { should route(:patch, '/api/photos/1').to(action: :update, id: 1) }

    it { should route(:delete, '/api/photos/1').to(action: :destroy, id: 1) }


  end
end
