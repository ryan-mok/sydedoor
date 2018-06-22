module SessionsHelper
	# [nil] Logs in the user
  def log_in(user)
  	session[:user_id] = user.id
  end

  # [nil] Logs out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # [User] Returns the current valid logged-in user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # [Bool] Returns if the user is logged in or not
  def logged_in?
  	!current_user.nil?
  end
end