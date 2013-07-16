class UserMailer < ActionMailer::Base
  default from: "Lifeakademie.cz <robot@lifeakademie.cz>"

  def confirm(user, host)
    @user = user
    @url = "http://#{host}#{confirm_registration_path(@user, @user.email_confirmation_hash)}"

    mail(to: @user.email, subject: "Registrace na webu lifeakademie.cz")
  end

  def order(order)
    @user = order.user
    @course = order.course
    @order = order

    mail(to: @user.email,
         subject: "Potvrzení objednávky č. #{@order.variable_symbol} na lifeakademie.cz"
        )
  end
end
