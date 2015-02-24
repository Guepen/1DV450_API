class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  include Api::V1::AuthsHelper

  def authenticate_developer
    authenticate_or_request_with_http_token do |token|
      Apikey.exists?(key: token)
    end
  end

  def authenticate_creator
    if request.headers['token'].present?
      auth_header = request.headers['token'].split(' ').last
      @token_payload = decode_jwt auth_header.strip

      if @token_payload
        @creator_id = @token_payload[0]['creator_id']
      else
        render json: { error: 'The provided login_token wasn´t correct' }, status: :bad_request
      end
    else
      render json: { error: 'Need to include the login_token header' }, status: :forbidden # The header isn´t present
    end
  end

  def pagination
    if params[:offset].present?
      @offset = params[:offset].to_i
    else
      @offset = 0
    end
    if params[:limit].present?
      @limit = params[:limit].to_i
    else
      @limit = 20
    end
  end
end
