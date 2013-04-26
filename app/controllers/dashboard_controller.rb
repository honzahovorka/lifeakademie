class DashboardController < ApplicationController

  before_filter :check_authentication

  def index
  end

  private

  def check_authentication
    redirect_to login_path, :alert => 'Nemáte oprávnění prohlížet si nástěnku. Nejprve se přihlašte.'.html_safe if current_user.nil?
  end

end
