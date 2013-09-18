class OrdersController < ApplicationController
  layout 'admin', only: [:index, :show]

  before_filter :check_authentication,      except: [:unpaid, :pay_order]
  before_filter :check_editor_privileges,   only:   [:index, :show]

  def index
    @orders = Order.all
    @total_price = 0

    @orders.each { |o| @total_price += o.price unless o.price.nil? }
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

    if params[:from_mail] == '1'
      render text: "Objednávka s variabilním symbolem #{@order.variable_symbol} byla nastavena jako zaplacena."
    else
      redirect_to admin_orders_path, notice: "Objednávka s VS #{@order.variable_symbol} úspěšně zaplacena"
    end
  end

  def unpaid
    @orders = Order.unpaid
    OrderMailer.unpaid(@orders, request.host).deliver

    render text: 'Odesláno'
  end
end
