
class SessionsController < ApplicationController
  include SessionsHelper
  before_action :stay_on_user_page, only: [:new, :create]

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username] )

    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'Felaktig kombination av Användarnamn/Lösenord'

      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = 'Du är nu utloggad'
    redirect_to root_url
  end


end
