class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    if cookies[:remember_me_id] and cookies[:remember_me_code] and User.find(cookies[:remember_me_id]) and User.find(cookies[:remember_me_id]).remember_me_code == cookies[:remember_me_code]
      @current_user ||= User.find(cookies[:remember_me_id])
    else
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
end
