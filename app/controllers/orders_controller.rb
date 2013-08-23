class OrdersController < ApplicationController
  layout 'admin', only: [:index, :show]

  before_filter :check_authentication,      except: []
  before_filter :check_editor_privileges,   only:   [:index, :show]

  def index
    @orders = Order.all
  end


  def storno
    @order = Order.find params[:id]
    if @order.user == current_user
      @order.storno!
      OrderMailer.storno(@order).deliver
      redirect_to profile_path, notice: "Objednávka č. #{@order.variable_symbol} úspěšně stornována"
    else
      redirect_to root_path, alert: 'Nemůžete stornovat objednávku'
    end
  end

  def pay_order
    @order = Order.find params[:id]
    @order.pay!
    OrderMailer.paid(@order).deliver

    redirect_to admin_orders_path, notice: "Objednávka s VS #{@order.variable_symbol} úspěšně zaplacena"
  end

  private

  def check_editor_privileges
    redirect_to login_path, alert: 'Nemáte dostatečné oprávnění pro vstup do administrace' unless current_user.editor?
  end
end
