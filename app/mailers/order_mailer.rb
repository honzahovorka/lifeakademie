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
end
