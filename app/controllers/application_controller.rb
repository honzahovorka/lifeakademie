class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  after_filter :return_to

  before_filter :set_up_miniprofiler

  private

  def current_user
    if cookies[:remember_me_id] && cookies[:remember_me_code] && User.find(cookies[:remember_me_id]) && User.find(cookies[:remember_me_id]).remember_me_code == cookies[:remember_me_code]
      @current_user ||= User.find(cookies[:remember_me_id])
    else
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  def return_to
    except_urls = %w(/prihlasit /admin/prihlasit /sessions /odhlasit)
    if !(except_urls.include?(request.path) || request.path.include?('ajax') || request.path.include?('reset-hesla') || request.path.include?('users') || request.path.include?('registrace'))
      session[:return_to] = request.path
    end
  end

  def check_authentication
    redirect_to login_path, alert: 'Nejprve se musíte přihlásit' if current_user.nil?
  end

  def check_editor_privileges
    redirect_to login_path, alert: 'Nemáte dostatečné oprávnění pro vstup do administrace' unless current_user.editor?
  end

  def set_up_miniprofiler
    if current_user && current_user.id == 1
      Rack::MiniProfiler.authorize_request
    end
  end
end
