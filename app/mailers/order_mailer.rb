class OrderMailer < ActionMailer::Base
  default from: "Lifeakademie.cz <nobody@lifeakademie.cz>"

  def storno(order)
    @order = order
    @user = order.user

    attachments.inline['logo.png'] = File.read("#{Rails.root.to_s}/app/assets/images/layout/logo.png")

    mail(
         to: order.user.email,
         subject: "Storno objednávky č. #{@order.variable_symbol} na lifeakademie.cz",
         bcc: ['janh@starlife.cz', 'info@lifeakademie.cz']
        )
  end

  def paid(order)
    @order = order
    @user = order.user

    attachments.inline['logo.png'] = File.read("#{Rails.root.to_s}/app/assets/images/layout/logo.png")

    mail(
         to: order.user.email,
         subject: "Platba objednávky č. #{@order.variable_symbol} přijata",
         bcc: ['janh@starlife.cz', 'info@lifeakademie.cz']
        )
  end

  def unpaid(orders, host)
    @orders = orders
    @date = DateTime.now
    @host = host

    attachments.inline['logo.png'] = File.read("#{Rails.root.to_s}/app/assets/images/layout/logo.png")

    mail(to: 'janh@starlife.cz', subject: "Nezaplacené objednávky k #{I18n.localize @date, format: :long}")
  end
end
