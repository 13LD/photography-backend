class Api::BaseController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    if request.headers['Authorization'].present?
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user.auth_token.token == request.headers['Authorization'].split(' ').last
    else
      render json: { error: 'Not placed Authorization header' }, status: 401
    end
  end
end
