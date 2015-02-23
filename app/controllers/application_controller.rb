class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  include Api::V1::AuthsHelper

# This method is for encoding the JWT before sending it out

  def authenticate_creator
    if request.headers['jwt'].present?
      auth_header = request.headers['jwt'].split(' ').last
      @token_payload = decode_jwt auth_header.strip
      @creator_id = @token_payload[0]['creator_id']
      #render json: @token_payload[0]['creator_id']
      if !@token_payload
        render json: { error: 'The provided token wasn´t correct' }, status: :bad_request
      end
    else
      render json: { error: 'Need to include the Authorization header' }, status: :forbidden # The header isn´t present
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
