class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # return the user who is currently logged in
  # available to all controller classes
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  # check if we are logged in
  def logged_in?
    if current_user
      return true
    else 
      return false
    end
  end

  # redirect to login page if not logged in
  def require_login
    unless logged_in?
      redirect_to "/sessions/new"
    end
  end

  helper_method :current_user, :logged_in?, :require_login
end
