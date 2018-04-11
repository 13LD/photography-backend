require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /contacts" do
    it "works! (now write some real specs)" do
      get api_contacts_path
      expect(response).to have_http_status(401)
    end
  end
end
