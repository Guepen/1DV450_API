class UsersController < ApplicationController
  include SessionsHelper
  before_action :check_user, only: [:show]
  before_action :correct_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      apikey = Apikey.new
      apikey.user = @user
      apikey.key = apikey.generate_api_key
      apikey.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    apikey = Apikey.find_by_user_id(@user.id)
    if apikey
      @key = apikey.key
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless current_user == @user
  end
end
