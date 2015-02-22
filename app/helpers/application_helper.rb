module ApplicationHelper
  def authenticate_developer
    authenticate_or_request_with_http_token do |token, options|
      Apikey.exists?(key: token)
    end
  end
end

