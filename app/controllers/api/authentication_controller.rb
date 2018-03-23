class Api::AuthenticationController < Api::BaseController
  skip_before_action :authenticate_request
  include Api::Concerns::Swaggers::AuthSwaggers

  def authenticate
    @user = User.find_by_email(params[:email])
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      @auth_token = AuthToken.new(
        token: command.result,
        user_id: @user.id
      )
      ##TODO: Fix this part

      @auth_token.save
      @user.auth_token = @auth_token
      @user.save
      render json: { auth_token: @auth_token.token }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
