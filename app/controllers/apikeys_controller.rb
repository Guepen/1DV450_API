class ApikeysController < ApplicationController

  def destroy
    @user = User.find(params[:id])
    apikey = Apikey.find_by_user_id(@user.id)
    apikey.destroy
    redirect_to @user
  end

  def generate
    user = User.find(params[:id])
    apikey = Apikey.new
    apikey.key = apikey.generate_api_key
    apikey.user = user

    apikey.save

    redirect_to user
  end
end
