class OrdersController < ApplicationController
  layout 'admin', only: [:index, :show]

  before_filter :check_authentication,      except: []
  before_filter :check_editor_privileges,   only:   [:index, :show]

  def index
    @orders = Order.all
  end

  private

  def check_editor_privileges
    redirect_to login_path, alert: 'Nemáte dostatečné oprávnění pro vstup do administrace' unless current_user.is_editor?
  end
end
