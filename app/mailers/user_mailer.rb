class UserMailer < ActionMailer::Base
  default from: "Lifeakademie.cz <nobody@lifeakademie.cz>"

  def confirm(user, host)
    @user = user
    @url = "http://#{host}#{confirm_registration_path(@user, @user.email_confirmation_hash)}"
    attachments.inline['logo.png'] = File.read("#{Rails.root.to_s}/app/assets/images/layout/logo.png")

    mail(to: @user.email, subject: "Registrace na webu lifeakademie.cz", bcc: 'janh@starlife.cz')
  end

  def password_reset(user, host)
    @user = user
    @url = "http://#{host}#{change_password_path(@user, @user.password_reset_hash)}"

    attachments.inline['logo.png'] = File.read("#{Rails.root.to_s}/app/assets/images/layout/logo.png")

    mail(
         to: @user.email,
         subject: "Reset hesla na lifeakademie.cz",
         bcc: ['janh@starlife.cz'],
         reply_to: 'info@lifeakademie.cz'
        )
  end

  def order(order)
    @user = order.user
    @course = order.course
    @order = order
    attachments.inline['logo.png'] = File.read("#{Rails.root.to_s}/app/assets/images/layout/logo.png")

    mail(
         to: @user.email,
         subject: "Potvrzení objednávky č. #{@order.variable_symbol} na lifeakademie.cz",
         bcc: ['janh@starlife.cz', 'info@lifeakademie.cz'],
         reply_to: 'info@lifeakademie.cz'
        )
  end
end
