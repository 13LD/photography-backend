require 'rails_helper'

RSpec.describe "Services", type: :request do
  describe "GET /services" do
    it "works! (now write some real specs)" do
      get api_services_path
      expect(response).to have_http_status(401)
    end
  end
end
