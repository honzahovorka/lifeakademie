class OrdersController < ApplicationController
  layout 'admin', only: [:index, :show, :edit, :update]

  before_filter :check_authentication,      except: [:unpaid, :pay_order]
  before_filter :check_editor_privileges,   only:   [:index, :show, :edit, :update, :admin_storno]

  # GET /admin/objednavky
  def index
    @orders = Order.all
    @total_paid = @total_unpaid = 0

    @orders.paid.each   { |o| @total_paid   += o.price unless o.price.nil? }
    @orders.unpaid.each { |o| @total_unpaid += o.price unless o.price.nil? }
  end

  # GET /admin/objednavka/:id
  def edit
    @order = Order.find params[:id]
    @courses = Course.all
  end

  # PATCH /admin/objednavka/:id
  def update
    @order = Order.find params[:id]
    @courses = Course.all

    respond_to do |format|
      if @order.update_attributes order_params
        format.html { redirect_to admin_orders_path, notice: 'Objednávka úspěšně upravena' }
      else
        format.html { render 'edit' }
      end
    end
  end

  def storno
    @order = Order.find params[:id]
    if @order.storno!(current_user)
      OrderMailer.storno(@order).deliver
      redirect_to profile_path, notice: "Objednávka č. #{@order.variable_symbol} úspěšně stornována"
    else
      redirect_to root_path, alert: 'Nemůžete stornovat objednávku'
    end
  end

  def admin_storno
    @order = Order.find params[:id]
      @order.storno!(current_user)
      OrderMailer.storno(@order).deliver
      redirect_to admin_orders_path, notice: "Objednávka č. #{@order.variable_symbol} úspěšně stornována"
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

    unless @orders.empty?
      OrderMailer.unpaid(@orders, request.host).deliver
      render text: 'Odesláno'
    else
      render text: 'Není nic k odeslání'
    end
  end

  private

  def order_params
    params.require(:order).permit(:course_id, :price)
  end
end
