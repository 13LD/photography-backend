require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get api_users_path
      expect(response).to have_http_status(401)
    end
  end
end
