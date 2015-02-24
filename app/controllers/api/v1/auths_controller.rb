class Api::V1::AuthsController < ApplicationController
  #before_action :authenticate_developer

  def authenticate
    c = Creator.find_by_username(request.headers['username'])

    if c && c.authenticate(request.headers['password'])
      render json: { auth_token: encode_jwt(c) }
    else
      render json: {error: 'wrong username or password'}
    end
  end
end
