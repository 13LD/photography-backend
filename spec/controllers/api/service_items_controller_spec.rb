require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe Api::ServiceItemsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ServiceItem. As you add validations to ServiceItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:service_item)
  }

  let(:invalid_attributes) {
    attributes_for(:service_item, description: " ")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ServiceItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  def authenticated_header
    @user = create(:user)
    @user.save
    command = AuthenticateUser.call(@user.email, @user.password)
    @auth_token = AuthToken.new(
        token: command.result,
        user_id: @user.id
    )

    @auth_token.save
    @user.auth_token = @auth_token
    @user.save

    { "Authorization" => command.result }
  end

  describe "GET #index" do
    it "returns a success response" do
      @request.headers.merge! authenticated_header
      service_item = create(:service_item)
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      @request.headers.merge! authenticated_header
      service_item = create(:service_item)
      get :show, params: {id: service_item.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ServiceItem" do
        @request.headers.merge! authenticated_header
        @service = create(:service)
        expect {
          post :create, params: {service_item: attributes_for(:service_item, service_id: @service.id)}, session: valid_session
        }.to change(ServiceItem, :count).by(1)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new service_item" do
        @request.headers.merge! authenticated_header
        post :create, params: {service_item: attributes_for(:service_item, description: " ")}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:service_item, description: "Desc")
      }

      it "updates the requested service_item" do
        @request.headers.merge! authenticated_header
        service_item = create(:service_item)
        put :update, params: {id: service_item.to_param, service_item: new_attributes}, session: valid_session
        service_item.reload
      end

      it "renders a JSON response with the service_item" do
        @request.headers.merge! authenticated_header
        service_item = create(:service_item)

        put :update, params: {id: service_item.to_param, service_item: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do

      it "renders a JSON response with errors for the service_item" do
        @request.headers.merge! authenticated_header
        service_item = create(:service_item)

        put :update, params: {id: service_item.to_param, service_item: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested service_item" do
      @request.headers.merge! authenticated_header
      service_item = create(:service_item)
      expect {
        delete :destroy, params: {id: service_item.to_param}, session: valid_session
      }.to change(ServiceItem, :count).by(-1)
    end
  end

end
