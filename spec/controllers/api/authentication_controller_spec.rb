require 'rails_helper'

RSpec.describe Api::AuthenticationController, type: :controller do
  let(:valid_session) { {} }

  describe "POST #authenticate" do
    it "returns a success response" do
      @user = create(:user)
      post :authenticate, params: {email: @user.email, password: @user.password}, session: valid_session
      expect(response).to be_success
    end

    it "returns a error response" do
      @user = create(:user)
      post :authenticate, params: {email: "wrong_email@gmail.com", password: @user.password}, session: valid_session
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "POST #logout" do
    it "returns a success response" do
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

      delete :logout, params: {email: @user.email}, session: valid_session
      expect(response).to have_http_status(:no_content)
    end

    it "returns a error response" do
      @user = create(:user)
      delete :logout, params: {email: @user.email}, session: valid_session
      expect(response).to have_http_status(:not_found)
    end
  end
end
