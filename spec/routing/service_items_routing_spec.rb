require "rails_helper"

RSpec.describe ServiceItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/service_items").to route_to("service_items#index")
    end


    it "routes to #show" do
      expect(:get => "/service_items/1").to route_to("service_items#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/service_items").to route_to("service_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/service_items/1").to route_to("service_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/service_items/1").to route_to("service_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/service_items/1").to route_to("service_items#destroy", :id => "1")
    end

  end
end
