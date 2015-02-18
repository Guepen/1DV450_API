module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    #gets current user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_logged_in?
    # is the current_user logged in - return true
    !current_user.nil?
  end

  def check_user
    unless is_logged_in?
      redirect_to login_path
    end
  end

  def stay_on_user_page
    if is_logged_in?
      redirect_to current_user
    end
  end

end
