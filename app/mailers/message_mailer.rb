class MessageMailer < ActionMailer::Base
  default from: "Lifeakademie.cz <robot@lifeakademie.cz>"
  default to: "info@lifeakademie.cz"
  # default to: "janh@starlife.cz"
  default subject: "Zpráva z kontaktního formuláře Lifeakademie.cz"

  def contact_message(contact_message)
    @contact_message = contact_message

    mail(reply_to: @contact_message.email)
  end
end
