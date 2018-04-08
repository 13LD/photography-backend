require 'rails_helper'

RSpec.describe "ServiceItems", type: :request do
  describe "GET /service_items" do
    it "works! (now write some real specs)" do
      get api_service_items_path
      expect(response).to have_http_status(401)
    end
  end
end
