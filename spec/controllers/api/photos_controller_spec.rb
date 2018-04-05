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

RSpec.describe Api::PhotosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Photo. As you add validations to Photo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:photo)
  }

  let(:invalid_attributes) {
    attributes_for(:photo, tag_id: nil)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostsController. Be sure to keep this updated too.
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
      photo = create(:photo)
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      @request.headers.merge! authenticated_header
      photo = create(:photo)
      get :show, params: {id: photo.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Photo" do
        tag = create(:tag)
        @request.headers.merge! authenticated_header
        expect {
          post :create, params: {photo: attributes_for(:photo, tag_id: tag.id)}, session: valid_session
        }.to change(Photo, :count).by(1)
      end

      it "renders a JSON response with the new photo" do
        tag = create(:tag)
        @request.headers.merge! authenticated_header
        post :create, params: {photo: attributes_for(:photo, tag_id: tag.id)}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')

      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new photo" do
        @request.headers.merge! authenticated_header
        post :create, params: {photo: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:photo, tag_id: 1)
      }

      it "updates the requested photo" do
        @request.headers.merge! authenticated_header
        photo = create(:photo)
        put :update, params: {id: photo.to_param, photo: new_attributes}, session: valid_session
        photo.reload

      end

      it "renders a JSON response with the photo" do
        @request.headers.merge! authenticated_header
        photo = create(:photo)
        put :update, params: {id: photo.to_param, photo: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the photo" do
        @request.headers.merge! authenticated_header
        photo = create(:photo)
        put :update, params: {id: photo.to_param, photo: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested photo" do
      @request.headers.merge! authenticated_header
      photo = create(:photo)
      expect {
        delete :destroy, params: {id: photo.to_param}, session: valid_session
      }.to change(Photo, :count).by(-1)
    end
  end

end
