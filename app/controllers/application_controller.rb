class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def login(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    redirect_to users_url
  end

  def logout(user)
    user.reset_session_token!
    session[:session_token] = nil
    redirect_to users_url
  end

  def current_user
    user = User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    if current_user.nil?
      redirect_to new_session_url
    end  
  end


end
