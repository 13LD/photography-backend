require "rails_helper"

RSpec.describe Api::UsersController, type: :routing do
  describe "routing" do

    it { should route(:get, '/api/users').to(action: :index) }

    it { should route(:get, '/api/users/1').to(action: :show, id: 1) }

    it { should route(:post, '/api/users').to(action: :create) }

    it { should route(:put, '/api/users/1').to(action: :update, id: 1) }

    it { should route(:patch, '/api/users/1').to(action: :update, id: 1) }

    it { should route(:delete, '/api/users/1').to(action: :destroy, id: 1) }

  end
end
