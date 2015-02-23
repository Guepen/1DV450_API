class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  def authenticate_developer
    authenticate_or_request_with_http_token do |token|
      Apikey.exists?(key: token)
    end
  end

  def authenticate_creator
    authenticate_with_http_basic do |username, password|
      c = Creator.find_by_username(username)

      c.authenticate(password) if c
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
