class ContactMessagesController < ApplicationController

  # POST /kontakt
  def create
    @contact_message = ContactMessage.new(params[:contact_message])

    if params[:spam_protection] != '2' || ! params[:surname].empty?
      redirect_to contact_path
      return
    end

    if @contact_message.valid?
      MessageMailer.contact_message(@contact_message).deliver
      redirect_to contact_path, notice: 'Zpráva úspěšně odeslána.'
    else
      render 'pages/contact'
    end
  end

end
