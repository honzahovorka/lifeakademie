class DashboardController < ApplicationController

  layout 'admin', only: [:admin]

  before_filter :check_authentication
  before_filter :check_editor_privileges, only: [:admin]

  def index
  end

  # GET /admin
  def admin
  end

end
